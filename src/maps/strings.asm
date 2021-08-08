INCLUDE "src/include/charmap.inc"

DLG_CLR0 EQU $F0
DLG_CLR1 EQU $F1
DLG_LINE EQU $F2
DLG_WKEY EQU $F3
DLG_EXEC EQU $F4
DLG_STOP EQU $FF ; debug

SECTION "Sign Strings", ROMX, BANK[4]

DialogString_ToInfoRoom::
	DB "Info room", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
DialogString_ToPlayground::
	DB "Playground", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	