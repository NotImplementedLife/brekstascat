INCLUDE "src/include/macros.inc"

SECTION "Cage Res", ROMX, BANK[3]

CatCageMetaSprite::

; cage
DB $40    , $78    , $04, %00010000
DB $40    , $78 + 8, $04, %00110000
DB $40 + 8, $78    , $05, %00010000
DB $40 + 8, $78 + 8, $05, %00110000

; cat
DB $40    , $78    , $00, $00
DB $40    , $78 + 8, $01, $00
DB $40 + 8, $78    , $02, $00
DB $40 + 8, $78 + 8, $03, $00

SECTION "Cage Logic", ROMX, BANK[3]

LoadCatCageSprite::
	
	ld hl, ShadowOAM+4*32
	ld de, CatCageMetaSprite
	ld bc, 32
	call loadMemory
	call waitForVBlank
	initOAM ShadowOAM
	ret
