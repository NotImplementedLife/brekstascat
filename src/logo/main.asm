SECTION "Logo Main Logic", ROMX, BANK[3]

Logo_Main::
	call clearVRAM
	call LogoBackground_InitVRAM
	call ChainModelInit
	
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
	