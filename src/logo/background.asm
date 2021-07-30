INCLUDE "src/include/macros.inc"

SECTION "Logo Background Tiles", ROMX, BANK[3]

LogoBackground_Tiles::

; chain platform
.chainPlatorm::
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff ; 30
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff ; 31
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff ; 32
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff ; 33

DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $f8 ; 34

DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00 ; 35
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00 ; 36
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00 ; 37
DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00 ; 38

DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00 ; 39

DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $00, $00, $00 ; 3A
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $00, $00, $00 ; 3B

DB $00, $00, $00, $00, $fe, $00, $fe, $00, $00, $ff, $00, $ff, $00, $00, $00, $00 ; 3C
DB $00, $00, $00, $00, $7f, $00, $7f, $00, $00, $ff, $00, $ff, $00, $00, $00, $00 ; 3D

; the wheel
DB $00, $00, $0c, $0c, $ff, $0b, $fb, $15, $1e, $fa, $06, $fe, $00, $00, $00, $00 ; 0E
DB $00, $00, $06, $06, $fe, $1a, $fb, $15, $0f, $fb, $0c, $fe, $00, $00, $00, $00 ; 0F (behaves like 0E)

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
DB $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E
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
	
	ld hl, $9300
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
	ld bc, LogoBackground_ChainPlatformEnd
	call loadMemorySTAT
	
	ret	