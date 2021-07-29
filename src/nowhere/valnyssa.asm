INCLUDE "src/include/macros.inc"

Valnyssa_Y EQU $18
Valnyssa_X EQU $40
Valnyssa_MY EQU $30
Valnyssa_MX EQU $48

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
	
ValnyssaFlash_1::
	xor a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret
	
ValnyssaFlash_2::
	ld a, %00100100
	ldh [rOBP0], a
	ld a, %11000000
	ldh [rOBP1], a
	ret
	
ValnyssaNegative::
	ld a, %11011011
	ldh [rOBP0], a
	ld a, %00111111
	ldh [rOBP1], a
	ret
	
ValnyssaAllBlack::
	ld a, %11111111
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

ValnyssaDarkBg::
	ld a, %11111001
	ldh [rBGP], a
	ret
	
ValnyssaNormBg::
	ld a, %11100100 
	ldh [rBGP], a
	ret
	
ValnyssaBlackBg::
	ld a, %11111111
	ldh [rBGP], a
	ret

ValnyssaMiniLoadTiles_1::
	ld hl, $8500
	ld de, Valnyssa_Mini_8500
	jr ValnyssaMiniLoadTiles_8.loadVM
	
ValnyssaMiniLoadTiles_2::
	ld hl, $8520
	ld de, Valnyssa_Mini_8500 + 2*16
	jr ValnyssaMiniLoadTiles_8.loadVM
	
ValnyssaMiniLoadTiles_3::
	ld hl, $8540
	ld de, Valnyssa_Mini_8500 + 4*16
	jr ValnyssaMiniLoadTiles_8.loadVM
	
ValnyssaMiniLoadTiles_4::
	ld hl, $8560
	ld de, Valnyssa_Mini_8500 + 6*16
	jr ValnyssaMiniLoadTiles_8.loadVM
	
ValnyssaMiniLoadTiles_5::
	ld hl, $8580
	ld de, Valnyssa_Mini_8500 + 8*16
	jr ValnyssaMiniLoadTiles_8.loadVM
	
ValnyssaMiniLoadTiles_6::
	ld hl, $85A0
	ld de, Valnyssa_Mini_8500 + 10*16
	jr ValnyssaMiniLoadTiles_8.loadVM

ValnyssaMiniLoadTiles_7::
	ld hl, $85C0
	ld de, Valnyssa_Mini_8500 + 12*16
	jr ValnyssaMiniLoadTiles_8.loadVM

ValnyssaMiniLoadTiles_8::
	ld hl, $85E0
	ld de, Valnyssa_Mini_8500 + 14*16
.loadVM
	REPT(32)
	ld a, [de]            
    ld [hli], a           
    inc de                
	ENDR
	ret
	
	
ValnyssaMiniLoadOAM::
	initOAM ValnyssaMini_SpriteData
	ldh a, [rLCDC]
	xor LCDCF_OBJ16
	ldh [rLCDC], a
	ld a, %00101100
	ldh [rOBP0], a
	xor a
	ldh [rOBP1], a
	ret
	
ValnyssaMiniFlip::
	ld hl, $FE00+16*4
	ld bc, 1
	
REPT(16)
	add hl, bc
	add hl, bc
	ld a, [hl]
	xor $3
	ld [hl], a
	add hl, bc
	ld a, [hl]
	xor %00100000
	ld [hl], a
	add hl, bc
ENDR	
	ret
	
ValnyssaCageLoad_1::
	ld hl, $8600
	ld de, Valnyssa_Cage_8600
	jr ValnyssaCageLoad_3.loadVC
	
ValnyssaCageLoad_2::
	ld hl, $8640
	ld de, Valnyssa_Cage_8600 + 4*16
	jr ValnyssaCageLoad_3.loadVC
	
ValnyssaCageLoad_3::
	ld hl, $8680
	ld de, Valnyssa_Cage_8600 + 8*16
.loadVC
	REPT(64)
	ld a, [de]            
    ld [hli], a           
    inc de                
	ENDR
	ret
	
ValnyssaCageShow::
	ld a, %11111111
	ldh [rOBP1], a
	ld hl, $FE00
	ld bc, 1
REPT(16)
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hl]
	xor %10000000
	ld [hl], a
	add hl, bc
ENDR	
	ret
	
ValnyssaCageAnimateAction::
	ld a, 2
	ld [PendingAction], a
	ret
	
ValnyssaFadeOut_1::
	ld a, %10010000
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, %10101010
	ldh [rOBP1], a
	ret
	
ValnyssaFadeOut_2::
	ld a, %01000000
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, %01010101
	ldh [rOBP1], a
	ret
	
ValnyssaFadeOut_3::
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, %01010101
	ldh [rOBP1], a
	ret
	
ValnyssaFadeOut_4::
	xor a
	ldh [rOBP1], a
	ret

ValnyssaNowhereExit::
	jp NowhereEnd

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

SECTION "Valnyssa Mini OAM", ROMX, ALIGN[8], BANK[2]
ValnyssaMini_SpriteData::

DB -24 + $00 * 8, Valnyssa_MX + $00 * 8, $60, %10010000
DB -24 + $00 * 8, Valnyssa_MX + $01 * 8, $61, %10010000
DB -24 + $00 * 8, Valnyssa_MX + $02 * 8, $62, %10010000
DB -24 + $00 * 8, Valnyssa_MX + $03 * 8, $63, %10010000

DB -24 + $01 * 8, Valnyssa_MX + $00 * 8, $64, %10010000
DB -24 + $01 * 8, Valnyssa_MX + $01 * 8, $65, %10010000
DB -24 + $01 * 8, Valnyssa_MX + $02 * 8, $66, %10010000
DB -24 + $01 * 8, Valnyssa_MX + $03 * 8, $67, %10010000

DB -24 + $02 * 8, Valnyssa_MX + $00 * 8, $64, %10010000
DB -24 + $02 * 8, Valnyssa_MX + $01 * 8, $65, %10010000
DB -24 + $02 * 8, Valnyssa_MX + $02 * 8, $66, %10010000
DB -24 + $02 * 8, Valnyssa_MX + $03 * 8, $67, %10010000

DB -24 + $03 * 8, Valnyssa_MX + $00 * 8, $68, %10010000
DB -24 + $03 * 8, Valnyssa_MX + $01 * 8, $69, %10010000
DB -24 + $03 * 8, Valnyssa_MX + $02 * 8, $6A, %10010000
DB -24 + $03 * 8, Valnyssa_MX + $03 * 8, $6B, %10010000

DB Valnyssa_MY + $00 * 8, Valnyssa_MX + $00 * 8, $50, %00000000
DB Valnyssa_MY + $00 * 8, Valnyssa_MX + $01 * 8, $51, %00000000
DB Valnyssa_MY + $00 * 8, Valnyssa_MX + $02 * 8, $52, %00000000
DB Valnyssa_MY + $00 * 8, Valnyssa_MX + $03 * 8, $53, %00000000

DB Valnyssa_MY + $01 * 8, Valnyssa_MX + $00 * 8, $54, %00000000
DB Valnyssa_MY + $01 * 8, Valnyssa_MX + $01 * 8, $55, %00000000
DB Valnyssa_MY + $01 * 8, Valnyssa_MX + $02 * 8, $56, %00000000
DB Valnyssa_MY + $01 * 8, Valnyssa_MX + $03 * 8, $57, %00000000

DB Valnyssa_MY + $02 * 8, Valnyssa_MX + $00 * 8, $58, %00000000
DB Valnyssa_MY + $02 * 8, Valnyssa_MX + $01 * 8, $59, %00000000
DB Valnyssa_MY + $02 * 8, Valnyssa_MX + $02 * 8, $5A, %00000000
DB Valnyssa_MY + $02 * 8, Valnyssa_MX + $03 * 8, $5B, %00000000

DB Valnyssa_MY + $03 * 8, Valnyssa_MX + $00 * 8, $5C, %00000000
DB Valnyssa_MY + $03 * 8, Valnyssa_MX + $01 * 8, $5D, %00000000
DB Valnyssa_MY + $03 * 8, Valnyssa_MX + $02 * 8, $5E, %00000000
DB Valnyssa_MY + $03 * 8, Valnyssa_MX + $03 * 8, $5F, %00000000


REPT(8)
DB Valnyssa_MY + $04 * 8, Valnyssa_MX + $00 * 8, $50, %10000000
ENDR






















