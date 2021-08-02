INCLUDE "src/include/macros.inc"

MACRO wait6vBlanks
	ld a, 6
	.wait10vb\@
	push af
	call waitForVBlank
	pop af
	dec a
	jr nz, .wait10vb\@
ENDM

SECTION "Logo Main Logic", ROMX, BANK[3]

Logo_Main::
	call waitForVBlank
	
	xor a
	ld [rBGP], a
	
	ld a, %10000111
	ldh [rOBP0], a
	ld a, %11111111
	ldh [rOBP1], a
	
	call clearVRAM
	call LogoBackground_InitVRAM
	call ChainModelInit
	
	call ChainVerticalLoadTiles
	call ValnyssaMicroLoadTiles
	
	call DiEnResInit
	call DiEn_Init
	
	call LogoInit
	
	call LoadCatCageSprite
	
	xor a
	ld [rSCX], a
	inc a
	ld [rSCY], a
	
	ld a, [rLCDC]
	res 2, a ; OBJ_8
	set 1, a ; OBJ_ON
	res 4, a ; tile set data $8800
	ld [rLCDC], a
	
	xor a
	ld [rOBP1], a
	
	call waitForVBlank
	
	wait6vBlanks
	ld a, %01000000
	ld [rBGP], a
	ld a, %01010101
	ld [rOBP1], a
	call ChainMoveCircular
	call ChainRender
	call waitForVBlank
	call ChainDraw
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase1
	
	wait6vBlanks
	ld a, %10010000
	ld [rBGP], a
	ld a, %10101010
	ld [rOBP1], a
	call ChainMoveCircular
	call ChainRender
	call waitForVBlank
	call ChainDraw
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase1	
	
	wait6vBlanks
	ld a, %11100100
	ld [rBGP], a
	ld a, %11100100
	ld [rOBP1], a
	
	call ChainMoveCircular
	call ChainRender
	call waitForVBlank
	call ChainDraw
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase1
	
	xor a
	ld [wCagePhase1Counter], a
	
.loopPhase1
	ld a, [wCagePhase1Counter]
	cp 40
	jr z, .endloopPhase1
	ld hl, wCagePhase1Counter
	inc [hl]
	call ChainMoveCircular
	call ChainRender

	call waitForVBlank	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call ChainVerticalUpdate_Phase1
	call waitForVBlank
	call ChainDraw
	ld a, [$986E] ; tilemap wheel address
	xor 1         ; $3E <-> $3F
	ld [$986E], a
	call waitForVBlank
	jr .loopPhase1
.endloopPhase1

	xor a
	ld [wCagePhase2Counter], a
.loopPhase2
	ld a, [wCagePhase2Counter]
	cp 16
	jr z, .endloopPhase2
	ld hl, wCagePhase2Counter
	inc [hl]
	
	call ChainMoveCircular
	call ChainRender

	call waitForVBlank
	ld hl, rSCY
	call waitForVBlank
	inc [hl]
	call waitForVBlank
	inc [hl]
	call waitForVBlank
	call waitForVBlank
	call ChainVerticalUpdate_Phase2
	call waitForVBlank
	call ChainDraw
	ld a, [$986E] ; tilemap wheel address
	xor 1         ; $3E <-> $3F
	ld [$986E], a
	call waitForVBlank
	jr .loopPhase2
.endloopPhase2
	
	xor a
	ld [wCagePhase3Counter], a
.loopPhase3
	call waitForVBlank
	ld a, [wCagePhase3Counter]
	or a
	call z, ChainsClearBg
	
	ld hl, rSCY
	call waitForVBlank
	inc [hl]
	call waitForVBlank
	inc [hl]
	ld a, [hl]
	cp $67
	jr nz, .skipResScY
	ld a, $07
	ld [hl], a
.skipResScY
	call waitForVBlank
	call waitForVBlank
	call DiEn_LoadNext
	call waitForVBlank
	ld a, [wEndFlag]
	cp 1
	push af
	call z, LogoLoadTM
	pop af
	jp z, LML2.endloopPhase3
	jr .loopPhase3
	
SECTION "Logo Main Logic 2", ROMX, BANK[3]

LML2:
.endloopPhase3:
	xor a
	ld [wCagePhase4Counter], a
.loopPhase4:
	ld hl, rSCY
	call waitForVBlank
	inc [hl]
	call waitForVBlank
	inc [hl]
	ld a, [hl]
	cp $67
	jr nz, .skipResScY2
	ld a, $07
	ld [hl], a
.skipResScY2
	call waitForVBlank
	ld hl, wCagePhase4Counter
	inc [hl]
	ld a, [wCagePhase4Counter]
	cp a, 46
	jr z, .endloopPhase4
	call waitForVBlank
	call waitForVBlank
	jr .loopPhase4
	
.endloopPhase4:
	xor a
	ld [wCagePhase5Counter], a
.loopPhase5:
	call waitForVBlank
	ld hl, wCagePhase5Counter
	inc [hl]
	ld a, [wCagePhase5Counter]
	;ld b,b
	cp a, 55
	jr z, .endloopPhase5
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	jr .loopPhase5
	
.endloopPhase5
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	ld a, %10010000
	ldh [rBGP], a
	call waitForVBlank
	call waitForVBlank
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	ld a, %01000000
	ldh [rBGP], a
	call waitForVBlank
	call waitForVBlank
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	xor a
	ldh [rBGP], a
	call waitForVBlank
	call waitForVBlank
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	call waitForVBlank
	call ChainVerticalUpdate_Phase5
	call waitForVBlank
	call ChainDraw
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	ld a, %10010000
	ldh [rOBP1], a
	wait6vBlanks
	wait6vBlanks
	
	ld a, %01000000
	ldh [rOBP1], a
	wait6vBlanks
	wait6vBlanks
	
	ld a, %00000000
	ldh [rOBP1], a
	wait6vBlanks
	wait6vBlanks
	
.introTerminate:
	jr @
	
SECTION "Logo Scene Vars", WRAM0

wCagePhase1Counter:
	DS 1
	
wCagePhase2Counter:
	DS 1
	
wCagePhase3Counter::
	DS 1
	
wCagePhase4Counter::
	DS 1
	
wCagePhase5Counter::
	DS 1
