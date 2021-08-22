INCLUDE "src/include/macros.inc"

SECTION "Maps Main Logic", ROMX, BANK[4]

Maps_Main::
	call waitForVBlank	
	xor a
	ldh [rBGP], a
	ldh [rSCY], a
	ldh [rSCX], a
	; init dialog
	ld [TMDialogActive], a
	ld [DownArr], a
	; init dialog Down Arr address
	ld a, $9C
	ld [ArrAddress], a
	ld a, $72
	ld [ArrAddress + 1], a

	
	
	ld a, [rLCDC]
	;res 2, a ; OBJ_8
	res 1, a ; OBJ_OFF
	set 4, a ; tile set data $8000
	set 5, a ; enable window
	set 6, a ; use window $9C00	
	ld [rLCDC], a	
	
	ld a, 144
	ldh [rWY], a
	ld a, 7
	ldh [rWX], a
	
	call clearVRAM

	call DialogInitWindow
	
	ld hl, $8800
	ld de, MapsGeneralTileset
	ld bc, MapsGeneralTilesetEnd
	call loadMemoryDOUBLE
	
	call MC_LoadTiles
	call MC_Init	
	call waitForVBlank
	call MC_Display
	
	ld hl, $8700
	ld de, CatCoinsTiles
	ld bc, CatCoinsTilesEnd
	call loadMemoryDOUBLE
	
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
	set 4, a ; tile set data $8000
	ldh [rLCDC], a
	call waitForVBlank
.loop
	call TileMap_Execute
	jp .loop

	
	jr @