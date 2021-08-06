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
	call MC_Init	
	call waitForVBlank
	call MC_Display
	
	xor a
	ldh [rSCX], a
	ldh [rSCY], a
	
	call MovQueueInit
	
	ld a, iMAP_Lobby
	call TileMap_Load
	
	call waitForVBlank
	call TileMap_Execute
	ld a, %11100100
	ldh [rBGP], a
	ld a, %11100100
	ldh [rOBP0], a
	ld a, [rLCDC]
	set 1, a ; OBJ_OFF
	res 4, a ; tile set data $8800
	ldh [rLCDC], a
	call waitForVBlank
.loop
	call TileMap_Execute
	jp .loop

	
	jr @