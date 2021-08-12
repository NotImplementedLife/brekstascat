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

_mAction_EnterPuzzleRoomE::
	; finish movQ if not ready (sometimes unfinished moves remain before raising event)
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 3
	ld [wPuzzle_Size], a
	
	call Puzzle_Init
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	ld a, %11100100
	ldh [rBGP], a
	
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	; movQ won't execute if the block MC is looking at is a barrier
	; (see MovQ_TerminateIfNotValid in maps/movq.asm)
	; Therefore, if we want to tell MC to automatically go down,
	; it must be oriented front (to the free area)
	; more simple and efficient approach: hIsValidStep = 0
	; this tells movQ it's ok to execute the command and
	; MC will automatically go down
	; [took hours to realize this fact so it must better be written somewhere :))]
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	ret

_mAction_EnterPuzzleRoomM::
	ret
	
_mAction_EnterPuzzleRoomH::
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
	
