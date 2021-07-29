INCLUDE "src/include/macros.inc"

SECTION "Logo Background Tiles", ROMX, BANK[3]

LogoBackground_Tiles::

; chain platform
.chainPlatorm
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff

DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $f8

DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00

DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00

DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $00, $00, $00
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $00, $00, $00

; the wheel
DB $00, $00, $0c, $0c, $7f, $0b, $7b, $15, $1f, $fa, $06, $ff, $00, $00, $00, $00
DB $00, $00, $06, $06, $7f, $1a, $7b, $15, $0f, $fb, $0c, $ff, $00, $00, $00, $00

.chainPlatormEnd

; generic wall 
.genericWall:
; row 1
DB $7f, $00, $7f, $00, $7f, $00, $00, $7f, $00, $00, $00, $00, $fe, $00, $fe, $00
DB $fe, $00, $fe, $00, $fe, $00, $00, $fe, $00, $00, $00, $00, $7f, $00, $7f, $00
; row 2
DB $fe, $00, $00, $fe, $00, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $00, $7f
DB $7f, $00, $00, $7f, $00, $00, $00, $00, $fe, $00, $fe, $00, $fe, $00, $00, $fe
; row 3
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $fe, $00, $00, $fe, $00, $00, $00, $00
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $00, $7f, $00, $00, $00, $00

LogoBackground_ChainPlatform:
DB $02, $03, $02, $03, $04, $05, $06, $05, $06, $07, $08, $09, $08, $09
LogoBackground_ChainPlatformEnd:

SECTION "Logo Background Logic", ROMX, BANK[3]

LogoBackground_InitVRAM::
	; load wall tiles
	ld hl, $9000
	ld de, LogoBackground_Tiles.genericWall
	ld bc, LogoBackground_Tiles.genericWall + 32
	call loadMemoryDOUBLE
	
	ld hl, $9100
	ld de, LogoBackground_Tiles.genericWall + 32
	ld bc, LogoBackground_Tiles.genericWall + 64
	call loadMemoryDOUBLE
	
	ld hl, $9200
	ld de, LogoBackground_Tiles.genericWall + 64
	ld bc, LogoBackground_Tiles.genericWall + 96
	call loadMemoryDOUBLE
	
	ld hl, $9020
	ld de, LogoBackground_Tiles.chainPlatorm
	ld bc, LogoBackground_Tiles.chainPlatormEnd
	call loadMemoryDOUBLE
	
	call waitForVBlank
	ld a, [rLCDC]
	xor a, LCDCF_BG8000
	ld [rLCDC], a
	
	; draw wall pattern on map
	ld hl, $9800
	ld bc, 12
	ld a, $20
	ld d, 1
	ld e, 32
.loop
	push af
	call waitForVBlank
	pop af
REPT(20)
	ld [hli], a
	xor d
ENDR
	add hl, bc
	add a, $10
	cp a, $30
	jr nz, .skip0
	xor a
.skip0
	dec e
	jr nz, .loop
	
	; draw chain platform
	;ld b,b
	ld hl, $9860
	ld de, LogoBackground_ChainPlatform
	ld bc, LogoBackground_ChainPlatform + 14
	call loadMemoryDOUBLE
	
	ld hl, $986D
	ld [hl], $0A ; the wheel
	
	
	ret	