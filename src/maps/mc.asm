INCLUDE "src/include/macros.inc"

SECTION "MC Logic", ROMX, BANK[4]

MC_LoadTiles::
	ld hl, $8200
	ld de, MCTiles
	ld bc, MCTilesEnd
	call loadMemoryDOUBLE
	ret
	
	