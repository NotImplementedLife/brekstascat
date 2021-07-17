INCLUDE "src/include/macros.inc"

Valnyssa_Y EQU $18
Valnyssa_X EQU $40

SECTION "Valnyssa metasprite logic", ROMX, BANK[2]

ValnyssaLoad::
	loadVRAM $8250, Valnyssa_8250,            Valnyssa_8250 + 11 * 16
	loadVRAM $8350, Valnyssa_8350,            Valnyssa_8350 + 11 * 16
	loadVRAM $8400, Valnyssa_8400,            Valnyssa_8400 + 16 * 16
	loadVRAM $8500, Valnyssa_8500,            Valnyssa_8500 + 16 * 16
	loadVRAM $8600, Valnyssa_8600,            Valnyssa_8600 + 16 * 16
	loadVRAM $8700, Valnyssa_8700,            Valnyssa_8700 + 16 * 16
	
	xor a
	;ld a, %00100100
	ldh [rOBP0], a
	
	;ld a, %11000000
	ldh [rOBP1], a
	
	call waitForVBlank
	initOAM Valnyssa_SpriteData
	;ldh a, [rLCDC]
	;or LCDCF_OBJON 
	;ldh [rLCDC], a
	ret

ValnyssaFadeIn_1::
	ldh a, [rLCDC]
	xor LCDCF_OBJON 
	ldh [rLCDC], a
	ld a, %01000000
	ldh [rOBP1], a
	ret
	
ValnyssaFadeIn_2::
	ld a, %10000000
	ldh [rOBP1], a
	ret
	
ValnyssaFadeIn_3::
	ld a, %11000000
	ldh [rOBP1], a
	ld a, %00010000
	ldh [rOBP0], a
	ret
	
ValnyssaFadeIn_4::
	ld a, %00010100
	ldh [rOBP0], a
	ret
	
ValnyssaFadeIn_5::
	ld a, %00100100
	ldh [rOBP0], a
	ret

ValnyssaShake_1::
	ld bc, 4
	ld hl, $FE01
	
	REPT(40)
	inc [hl]
	inc [hl]
	inc [hl]
	add hl, bc
	ENDR
	
	ret
	
ValnyssaShake_2::
	ld bc, 4
	ld hl, $FE01
	
	REPT(40)
	dec [hl]
	dec [hl]
	dec [hl]
	add hl, bc
	ENDR
	
	ret

SECTION "Valnyssa OAM", ROMX, ALIGN[8], BANK[2]

Valnyssa_SpriteData::
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $00 * 8, $26, %00000000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $01 * 8, $28, %00000000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $02 * 8, $2A, %00000000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $03 * 8, $2C, %00000000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $04 * 8, $2E, %00000000

DB Valnyssa_Y + $00 * 16, Valnyssa_X + $01 * 8, $36, %00010000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $02 * 8, $38, %00010000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $03 * 8, $3A, %00010000
DB Valnyssa_Y + $00 * 16, Valnyssa_X + $04 * 8, $3C, %00010000

DB Valnyssa_Y + $01 * 16, Valnyssa_X + $01 * 8, $3E, %00000000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $02 * 8, $40, %00000000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $03 * 8, $42, %00000000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $04 * 8, $44, %00000000

DB Valnyssa_Y + $01 * 16, Valnyssa_X + $01 * 8, $46, %00010000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $02 * 8, $48, %00010000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $03 * 8, $4A, %00010000
DB Valnyssa_Y + $01 * 16, Valnyssa_X + $04 * 8, $4C, %00010000

DB Valnyssa_Y + $02 * 16, Valnyssa_X + $01 * 8, $50, %00000000
DB Valnyssa_Y + $02 * 16, Valnyssa_X + $02 * 8, $52, %00000000
DB Valnyssa_Y + $02 * 16, Valnyssa_X + $03 * 8, $54, %00000000
DB Valnyssa_Y + $02 * 16, Valnyssa_X + $04 * 8, $56, %00000000

DB Valnyssa_Y + $02 * 16, Valnyssa_X + $01 * 8, $58, %00010000
DB Valnyssa_Y + $02 * 16, Valnyssa_X + $04 * 8, $5A, %00010000

DB Valnyssa_Y + $03 * 16, Valnyssa_X + $00 * 8, $5C, %00000000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $01 * 8, $5E, %00000000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $02 * 8, $60, %00000000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $03 * 8, $62, %00000000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $04 * 8, $64, %00000000

DB Valnyssa_Y + $03 * 16, Valnyssa_X + $00 * 8, $66, %00010000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $01 * 8, $68, %00010000
DB Valnyssa_Y + $03 * 16, Valnyssa_X + $04 * 8, $6A, %00010000

DB Valnyssa_Y + $04 * 16, Valnyssa_X + $00 * 8, $6C, %00000000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $01 * 8, $6E, %00000000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $02 * 8, $70, %00000000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $03 * 8, $72, %00000000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $04 * 8, $74, %00000000

DB Valnyssa_Y + $04 * 16, Valnyssa_X + $00 * 8, $76, %00010000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $01 * 8, $78, %00010000
;DB Valnyssa_Y + $04 * 16, Valnyssa_X + $02 * 8, $7A, %00010000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $03 * 8, $7C, %00010000
DB Valnyssa_Y + $04 * 16, Valnyssa_X + $04 * 8, $7E, %00010000
