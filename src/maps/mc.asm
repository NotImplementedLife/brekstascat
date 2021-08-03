INCLUDE "src/include/macros.inc"

SECTION "MC Vars", ROM0

; Orientation
; 0 = front, 1 = bank, 2 = left, 3 = right
wMC_Orientation::
	DS 1

; Position on Screen
wMC_ScreenY::
	DS 1
wMC_ScreenX::
	DS 1
	
SECTION "MC Logic", ROMX, BANK[4]

MC_LoadTiles::
	ld hl, $8200
	ld de, MCTiles
	ld bc, MCTilesEnd
	call loadMemoryDOUBLE
	ret
	

SECTION "MC Sprite Presets", 