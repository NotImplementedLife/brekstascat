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
	
	;ld b,b
	call DisplayPuzzleListHighScore
	call waitForVBlank
	
.loop
	call updateJoypadState
	ld   a, [wJoypadPressed]
	bit PADB_LEFT, a
	jr nz, TableLeft
	bit PADB_RIGHT, a
	jr nz, TableRight
	and PADF_B
	jr z, .loop
	
	xor a
	ld [OffsetX], a
	jp RestoreVRAMSnapshot

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
	xor a
	ld [OffsetX], a
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
	xor a
	ld [OffsetX], a
	setBank 4
	jp _mAction_Inforoom_HighScoreRead.viewTable
	
SECTION "HighScore tables list", ROM0, ALIGN[8]
HSTablesList:
DW _3x3_PuzzlesList, _4x4_PuzzlesList, _5x5_PuzzlesList, _6x6_PuzzlesList
	
SECTION "Highscore table selection", WRAM0

wHSTableSelected:
	DS 1

SECTION "Reward Pending", WRAM0

wCCReward::
	DS 1

wRewardMessage::
	DS 30 ; 26 ?
	
SECTION "mActions Enter Easy", ROMX, BANK[4]
_mAction_EnterPuzzleRoomE::
	; finish movQ if not ready (sometimes unfinished moves remain before raising event)
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	xor a
	ld [wPuzMusicOffset], a
	ld [wPuzCoolDown], a
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 3
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	; ld b,b
	; ran this on Sameboy and there seemed to be a bug
	; when player completes a puzzle and starts a new one,
	; the timer fails to reset
	; the issue disappeared when I changed the emulation settings
	; RTC -> Accurate instead of Sync to System Clock
	; so I guess there's no problem after all?
	call rtcReset
.loop
	call ProcessMusicPuzzle
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

SECTION "mActions Enter Medium", ROMX, BANK[4]
_mAction_EnterPuzzleRoomM::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR

	ld a, HIGH( MediumPaymentNotice )
	ld [StrAddr], a
	ld a, LOW( MediumPaymentNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	ld a, [sCatCoins]
	cp 2
	jr nc, .proceed
	
	ld a, HIGH( NotEnoughMoneyNotice )
	ld [StrAddr], a
	ld a, LOW( NotEnoughMoneyNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	;exit gloriously :))
	xor a
	ld [hIsValidStep], a

	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
.proceed
	ld a, [sCatCoins]
	sub 2
	daa
	ld [sCatCoins], a
	
	xor a
	ld [wPuzMusicOffset], a
	ld [wPuzCoolDown], a
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 4
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call ProcessMusicPuzzle
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
	
SECTION "mActions Enter Hard", ROMX, BANK[4]
_mAction_EnterPuzzleRoomH::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	ld a, HIGH( HardPaymentNotice )
	ld [StrAddr], a
	ld a, LOW( HardPaymentNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	ld a, [sCatCoins]
	cp 4
	jr nc, .proceed
	
	ld a, HIGH( NotEnoughMoneyNotice )
	ld [StrAddr], a
	ld a, LOW( NotEnoughMoneyNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	;exit gloriously :))
	xor a
	ld [hIsValidStep], a

	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
.proceed
	ld a, [sCatCoins]
	sub 4
	daa
	ld [sCatCoins], a
	
	xor a
	ld [wPuzMusicOffset], a
	ld [wPuzCoolDown], a
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 5
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call ProcessMusicPuzzle
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
	
SECTION "mActions Enter Master", ROMX, BANK[4]
_mAction_EnterPuzzleRoomX::
	REPT(3)
	call TileMap_Execute_OnlyMovQ
	ENDR
	
	xor a
	ld [wPuzMusicOffset], a
	ld [wPuzCoolDown], a
	
	; backup VRAM$8800, Tilemap$9800 and OAM and prepare to run the Game room
	call TakeVRAMSnapshot
	
	ld a, 6
	ld [wPuzzle_Size], a
	call Sqr
	ld [wPuzzle_MSize], a
	
	call Puzzle_Init
	
.loop
	call ProcessMusicPuzzle
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
	
	; check CatCoinsReward!=0 to see if player completed
	; the puzzle or just pressed B to exit
	ld a, [wCCReward]
	or a
	jr z, .notCompleted
	
	; The game is practically finished
	; run the ending
	pop af ; fake ret
	jp EndingMain
.notCompleted:
	; restore VRAM$8800, Tilemap$9800 & OAM and continue map execution
	call RestoreVRAMSnapshot
	
	xor a
	ld [hIsValidStep], a
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	

SECTION "Action exit puzzle", ROMX, BANK[4]
_mAction_ExitPuzzleRoomE::
_mAction_ExitPuzzleRoomM::
_mAction_ExitPuzzleRoomH::
	ld a, [wCCReward]
	or a
	ret z
	
	ld [wRewardMessage + 8], a
	
	push af
	ld a, HIGH( wRewardMessage )
	ld [StrAddr], a
	ld a, LOW( wRewardMessage )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	pop af
	
	ld c, a
.loop
	push bc
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	pop bc
	ld hl, sCatCoins
	ld a, [hl]
	add 1
	daa
	cp $51
	jr nc, .pocketsFull
	
	ld [hl], a
	dec c
	jr nz, .loop
	xor a
	ld [wCCReward], a
	jp TileMap_Execute_OnlyMovQ
	
.pocketsFull
	; executes if players attempt to get more than 50 Cat Coins
	ld a, $50
	ld [sCatCoins], a
	
	ld a, HIGH( PocketsFullNotice )
	ld [StrAddr], a
	ld a, LOW( PocketsFullNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	xor a
	ld [wCCReward], a
	
	jp TileMap_Execute_OnlyMovQ
	

	
_mAction_ExitPuzzleRoomX::
	ret
	
SECTION "Action Snake", ROM0;, BANK[4]
_mAction_Snake::	
	; check the column where the player is to set the snake's orientation accordingly
	ldh a, [hMMCX]
	cp $0C
	call z, __snakeSetLeft
	cp $0D
	call z, __snakeSetFront
	cp $0E
	call z, __snakeSetRight
	
	; allow acces to Master room only if player has 20 coins
	ld a, [sCatCoins]
	cp $20
	jr c, .negative
	
	PlayDialog Snake20	
	
.negative
	PlayDialog SnakeNot20	
	
SECTION "Snake pos", ROM0
__snakeSetFront::
	ld b, $58
	jr __snakeUpdate
	
__snakeSetLeft::
	ld b, $60
	jr __snakeUpdate
	
__snakeSetRight::
	ld b, $5C
	jr __snakeUpdate
	
__snakeUpdate::
	ld hl, ShadowOAM + $22
	ld c, 4
.loop
	ld [hl], b
	inc b
	inc l
	inc l
	inc l
	inc l
	dec c
	jr nz, .loop
	ret
	
; Playground loads by default with the snake enabled
; disable snake if cleared when enter the map
__snakeCheckOnMapExnter::	
	ld a, [wSnakeCleared]
	or a
	ret z
	jp SnakeClear
	
SECTION "NPC P", ROMX, BANK[4]

_mAction_Inforoom_SpeakToP::
	; reseed rand
	ld hl, rSeed1
	ldh a, [$FF04]
	ld [hli], a
	call rtcGetMinutes
	ld [hli], a
	call rtcGetHours
	ld [hli], a
	ld a, $47
	ld [hl], a
	; check the column where the player is to set the snake's orientation accordingly
	ldh a, [hMMCX]
	cp $03
	call z, __pSetBack
	cp $04
	call z, __pSetRight
	;ld b,b
	; pick a random line from Str0 to Str3
	ld b, 9
	call rand
	rlca
	ld c, a
	ld b, 0
	ld hl, P_StrAddresses
	add hl, bc
	
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld a, h
	ld [StrAddr], a
	ld a, l
	ld [StrAddr + 1], a	
	jp Tilemap_DialogRender

SECTION "NPC P Place", ROMX, BANK[4]
__pSetBack::
	ld b, $68
	jp __snakeUpdate ; it's the same code
	
__pSetRight::
	ld b, $64
	jp __snakeUpdate
	
	
SECTION "mAction Lever", ROM0

_mAction_Lever::
	; calls lever routine from bank 5 because banks 0,4 are full
	setBank 5
	
	call LeverAction
	
	setBank 4
	ret
	
SECTION "Lever Action 5", ROMX, BANK[5]


; logic for the reset lever in the info room
; main idea: show a dialog and let the user choose
; whether or not to reset the game
LeverAction::
	ldh a, [hMMCY]
	cp $09
	jr z, .skipPhide
	
	ld hl, ShadowOAM+17
	ld bc, 4
	ld d, 32
	ld e, 4
.hidePloop
	ld a, [hl]
	sub d
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .hidePloop
	
	call ProcessMusicDoubleCooldown
	call waitForVBlank
	initOAM ShadowOAM
	
.skipPhide
	
	ld a, HIGH( LeverDialog )
	ld [StrAddr], a
	ld a, LOW( LeverDialog )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	ldh a, [hMMCY]
	cp $09
	jr z, .skipPshow

	ld hl, ShadowOAM+17
	ld bc, 4
	ld d, 32
	ld e, 4
.showPloop
	ld a, [hl]
	add d
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .showPloop
	
	call ProcessMusicDoubleCooldown
	call waitForVBlank
	initOAM ShadowOAM
	
.skipPshow
	
	ld a, [wReset]
	or a
	ret z
	
	; in this point, we prepare the game reset
	
	ld a, $93
	ld [$9A0F], a
	ld a, $F9
	ld [$9A10], a
	inc a
	ld [$9A2F], a
	inc a
	ld [$9A30], a
	
	call waitForVBlank
	
	; alter the SRAM key so the .sav file will be invalid at next check
	xor a
	ld hl, $A000
	ld b, 16
.resetSavLoop
	ld [hli], a
	dec b
	jr nz, .resetSavLoop
	
	ld hl, ShadowOAM + 16
	ld b, 144
	xor a
.clearSprites
	ld [hli], a
	dec b
	jr nz, .clearSprites
	
	call waitForVBlank
	initOAM ShadowOAM
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %10100100
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %10100100
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %10010100
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %01010100
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %01010000
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	ld a, %01000000
	ldh [rBGP], a
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	xor a
	ldh [rBGP], a
	
	REPT(20)
	call waitForVBlank
	ENDR

	ld hl, $FFFE
	ld sp, hl
	jp Start
	ret
	
LeverResetChoose::
	xor a
	ld [wReset], a
	ld a, $F8
	ld [$9C6C], a
	
.loop
	call updateJoypadState
	call ProcessMusicDoubleCooldown
	call waitForVBlank
	ld a, [wJoypadPressed]
	
	push af
	and PADF_LEFT
	call nz, LeverResetPressedLeft
	pop af
	
	push af
	and PADF_RIGHT
	call nz, LeverResetPressedRight
	pop af
	
	push af
	and PADF_A
	call nz, LeverResetCheck
	pop af
	
	and PADF_B
	jr z, .loop
	
	ld a, $13
	ld [$9C65], a
	
	ld a, $1A
	ld [$9C6C], a
	
	ret
	
LeverResetPressedLeft::
	; wReset = 0 is not necessary, but I'm too afraid to remove it :))
	xor a
	ld [wReset], a
	
	; dialog shows "   >Yes    _No    "
	ld a, $F8
	ld [$9C65], a
	
	ld a, $93
	ld [$9C6C], a
	
	ret
	
LeverResetPressedRight::
	xor a
	ld [wReset], a
	
	
	; dialog shows "   _Yes    >No    "
	ld a, $93
	ld [$9C65], a
	
	ld a, $F8
	ld [$9C6C], a

	ret
	
LeverResetCheck::
	pop af ; reply to push af when A pressed which was never popped
	pop af ; fake return from LeverResetChoose
	
	ld a, [$9C65]
	ld b, a
	
	ld a, $13
	ld [$9C65], a
	ld a, $1A
	ld [$9C6C], a
	
	; if dialog shows "  >Yes   _No", reset the game [I don't have a better idea and this works so yee]
	ld a, b
	cp $F8
	ret nz
	ld a, 1
	ld [wReset], a	
	ret
	
SECTION "Puzzle room loading vars", WRAM0

wEnterEasy::
	DS 1
	
; WRAM copy of sSnakeCleared
wSnakeCleared:: 
	DS 1
	
wReset::
	DS 1
