INCLUDE "src/include/macros.inc"

MACRO PlayDialog
	ld a, HIGH( \1 )
	ld [StrAddr], a
	ld a, LOW( \1 )	
	ld [StrAddr + 1], a	
	jp Tilemap_DialogRender
ENDM

SECTION "mActions", ROMX, BANK[4]

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
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput3x3
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
	
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
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput4x4
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
	
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
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput5x5
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
	
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
	
_mAction_ExitPuzzleRoomX::
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
	call updateJoypadState
	ld   a, [wJoypadPressed]
	call ProcessMoveInput6x6
	ld   a, [wJoypadPressed]
	and PADF_B
	jr z, .loop
	
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


	
SECTION "Puzzle room loading vars", WRAM0

wEnterEasy::
	DS 1
	
