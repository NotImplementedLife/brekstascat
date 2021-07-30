INCLUDE "src/include/macros.inc"

MACRO wait10vBlanks
	ld a, 10
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
	call ChainModelInit ; horizontal
	
	call ChainVerticalLoadTiles
	call ValnyssaMicroLoadTiles
	
	call LoadCatCageSprite
	
	ld a, [rLCDC]
	res 2, a ; OBJ_8
	set 1, a ; OBJ_ON
	ld [rLCDC], a
	
	wait10vBlanks
	ld a, %01000000
	ld [rBGP], a
	
	wait10vBlanks
	ld a, %10010000
	ld [rBGP], a
	
	wait10vBlanks
	ld a, %11100100
	ld [rBGP], a
		
.loop
	call ChainMoveCircular
	call ChainRender

	call waitForVBlank	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	call ChainDraw
	ld a, [$986E] ; tilemap wheel address
	xor 1         ; $3E <-> $3F
	ld [$986E], a
	jr .loop
	jr @
	