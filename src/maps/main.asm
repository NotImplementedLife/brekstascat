INCLUDE "src/include/macros.inc"

SECTION "Maps Main Logic", ROMX, BANK[4]

Maps_Main::
	call waitForVBlank	
	xor a
	ldh [rBGP], a
	ldh [rSCY], a
	ldh [rSCX], a
	
	ld a, [rLCDC]
	;res 2, a ; OBJ_8
	res 1, a ; OBJ_OFF
	res 4, a ; tile set data $8800
	ld [rLCDC], a
	
	call clearVRAM
	ld hl, $9000
	ld de, MapsGeneralTileset
	ld bc, MapsGeneralTilesetEnd
	call loadMemoryDOUBLE
	
	call MC_LoadTiles
	
	ld a, iMAP_Lobby
	call TileMap_Load
	
	call waitForVBlank
	ld a, %11100100
	ldh [rBGP], a
	
	jr @