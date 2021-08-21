INCLUDE "src/include/macros.inc"

MACRO PlayDialog
	ld a, HIGH( \1 )
	ld [StrAddr], a
	ld a, LOW( \1 )	
	ld [StrAddr + 1], a	
	jp Tilemap_DialogRender
ENDM

SECTION "mActions", ROM0

_mAction_NoOp::
	ret
	
_mAction_Lobby_GoDown37::
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
_mAction_Lobby_Sign_InfoRoom::
	PlayDialog DialogString_ToInfoRoom
	
_mAction_Lobby_Sign_Playground::
	PlayDialog DialogString_ToPlayground	
	
_mAction_Playground_SacredStone_Dialog::
	ldh a, [hMMCO]
	cp 1
	jr nz, .wrongView
	PlayDialog DialogString_SacredStone
.wrongView
	PlayDialog DialogString_SacredStoneWrongView
	
_mAction_Playground_Sign_Instructions::
	ldh a, [hMMCO]
	cp 1
	ret nz
	PlayDialog DialogString_PlaygroundInstructions
	
_mAction_Inforoom_HighScoreRead::
	ld a, HIGH(DialogString_HighScoreMessage)
	ld [StrAddr], a
	ld a, LOW(DialogString_HighScoreMessage)	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	call TakeVRAMSnapshot
	
	xor a
	ld [wHSTableSelected], a

.viewTable:
	ld a, [wHSTableSelected]
	rlca
	ld h, HIGH(HSTablesList)
	ld l, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	call DisplayPuzzleListHighScore
	call waitForVBlank
	
.loop
	call updateJoypadState
	ld   a, [wJoypadPressed]
	bit PADB_LEFT, a
	push af
	call nz, TableLeft
	pop af
	bit PADB_RIGHT, a
	push af
	call nz, TableRight
	pop af
	and PADF_B
	jr z, .loop
	
	xor a
	ld [OffsetX], a
	setBank 4
	call RestoreVRAMSnapshot
	ret

TableLeft::
	ld a, [wHSTableSelected]
	cp 0
	jr z, .last
	dec a
	ld [wHSTableSelected], a
	jr .fin
.last:
	ld a, 3
.fin
	ld [wHSTableSelected], a
	pop af ; fake ret
	xor a
	ld [OffsetX], a
	setBank 4
	jp _mAction_Inforoom_HighScoreRead.viewTable
	
TableRight::
	ld a, [wHSTableSelected]
	cp 3
	jr z, .first
	inc a
	ld [wHSTableSelected], a
	jr .fin
.first:
	xor a
.fin
	ld [wHSTableSelected], a
	pop af ; fake ret
	xor a
	ld [OffsetX], a
	setBank 4
	jp _mAction_Inforoom_HighScoreRead.viewTable
	
SECTION "HighScore tables list", ROMX, BANK[4], ALIGN[8]
HSTablesList:
DW _3x3_PuzzlesList, _4x4_PuzzlesList, _5x5_PuzzlesList, _6x6_PuzzlesList
	
SECTION "Highscore table selection", WRAM0

wHSTableSelected:
	DS 1

SECTION "mActions Enter Easy", ROMX, BANK[4]
_mAction_EnterPuzzleRoomE::
	; finish movQ if not ready (sometimes unfinished moves remain before raising event)
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 3
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call waitForVBlank
	call RenderTimer
	
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput3x3
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
.end::
	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	; movQ won't execute if the block MC is looking at is a barrier
	; (see MovQ_TerminateIfNotValid in maps/movq.asm)
	; Therefore, if we want to tell MC to automatically go down,
	; it must be oriented front (to the free area)
	; more simple and efficient approach: hIsValidStep = 0
	; this tells movQ it's ok to execute the command no matter
	; the orientation and MC will automatically go down
	; [took hours to realize this fact so it must better be written somewhere :))]
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	ret

SECTION "mActions Enter Medium", ROMX, BANK[4]
_mAction_EnterPuzzleRoomM::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 4
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call waitForVBlank
	call RenderTimer
	
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput4x4
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
.end::
	
	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	ret
	
SECTION "mActions Enter Hard", ROMX, BANK[4]
_mAction_EnterPuzzleRoomH::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 5
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call waitForVBlank
	call RenderTimer
	
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput5x5
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
.end::

	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	ret
	
_mAction_EnterPuzzleRoomX::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 6
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call waitForVBlank
	call RenderTimer
	
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput6x6
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
.end::
	
	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	ret
	

_mAction_ExitPuzzleRoomE::
	ret

_mAction_ExitPuzzleRoomM::
	ret

_mAction_ExitPuzzleRoomH::
	ret
	
_mAction_ExitPuzzleRoomX::
	ret


	
SECTION "Puzzle room loading vars", WRAM0

wEnterEasy::
	DS 1
	
