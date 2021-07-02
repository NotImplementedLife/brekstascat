INCLUDE "src/include/macros.inc"

SECTION "Nowhere logic", ROMX, BANK[1]


; 3*(n+1) cycles, where n = number of steps (\1)
; for the next hBlank use "burn 17"
MACRO burn
	ld a, \1                 ; 2
.burn_loop\@
	dec a                    ; 1
	jr nz, .burn_loop\@      ; 2 / 3
ENDM
	
Nowhere_Main::
	xor a
	ld [rBGP], a
	
	; Center horizontally
	ld a, 48
	ld [rSCX], a	
	
	xor a
	ld [rSCY], a
	
	; load font
	loadVRAM_DOUBLE $8000, Chars              , Chars_End	
	
	; load BG96 tileset & tilemap
	loadVRAM_DOUBLE $9000, BG96_TILESET       , BG96_TILESET + $800
	loadVRAM_DOUBLE $8800, BG96_TILESET + $800, BG96_TILESET_End		
	loadVRAM_DOUBLE $9800, BG96_TILEMAP       , BG96_TILEMAP_End
	
	call waitForVBlank
	ld a, LCDCF_ON | LCDCF_BGON; | LCDCF_BG8000
	ldh [rLCDC], a
	
	ld a, %11100100
	ld [rBGP], a
	
	; "nowhere" main loop
.loop

	; wait for hBlank 
.line0
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0
	burn 17
.line0b
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0b
	
	REPT($60)
		wait_vram	
		;ld b,b
		burn 17
	ENDR
	
	wait_vram	
	ldh a, [rLCDC]
	xor LCDCF_BG8000
	ldh [rLCDC], a	
	burn 17
	
	REPT(144 - $60)
		wait_vram		
		burn 17
	ENDR
	;ld b,b
	
	ldh a, [rLCDC]
	xor LCDCF_BG8000
	;and ($FF ^ LCDCF_BG8000)
	ldh [rLCDC], a	
	
	burn 17
	
	
	
	jp .loop
	
	ldh a, [rLY]
	cp a, $5F
	jr nz, .skipLCDC	
	
	ldh a, [rLCDC]
	or LCDCF_BG8000
	ldh [rLCDC], a	
.skipLCDC:
	ldh a, [rLY]
	cp a, 143
	jr nz, .skipLCDCres
	ldh a, [rLCDC]
	and ($FF ^ LCDCF_BG8000)
	ldh [rLCDC], a	
.skipLCDCres:
	;jr .loop
	
	
	
	