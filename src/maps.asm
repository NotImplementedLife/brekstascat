; a little scrollmap engine
; map size is 16x16 and cosists of 256 2x2 metatiles

INCLUDE "src/include/macros.inc"

SECTION "Scroll map Metadata", WRAM0, ALIGN[8]

; wMapMetadata
; byte at offset 16*y+x tells the following about the position (x,y)
; bit 0 : 0 = barrier, 1 = can walk on
; bit 1 : 0 = free, 1 = occupied by an NPC
; bit 2 : not used
; bits 3-7 : the last 5 bits of an address pointing to an action to be executed on A button press (wMActions)
; 
; IMPORTANT: metatiles are not aligned with the visual 8x8 tiles. Metaposition (x=0,y=0) covers the 
; tiles (1,0),(2,0),(1,1),(2,1) on the tilemap. Everything is shifted right by one tile. Therefore,
; the real metadata size (the useful space) is 16*15 bytes. The 16th byte on each line is just padding. 
wMapMetadata:: 
	DS 16*16
	
wMapExitPointsCount::
	DS 1
; Exit Points
; An exit points (Y, X, M, Y', X') tells the program to exit the map when character steps on (X, Y) 
; and load map at index M with the character at position (X', Y')
wMapExitPoints::
	DS 5*8 ; 8 is more than enough, I suppose
	
SECTION "Scroll map MapActions", WRAM0, ALIGN[6]

; Note: for the event to be executed at metatile (x,y), player must be faced to that tile when A key is pressed
wMActions::
	DS 64 ; 32 MActions * 2 bytes per address

SECTION "Scroll map NPCs", WRAM0, ALIGN[8]

wMnpcCount::
	DS 1
; NPC Data
; For each NPC:
;  bytes 0-3 : Orientation:Front tiles
;  bytes 4-7 : Orientation:Back tiles
;  bytes 8-11 : Orientation:Lateral tiles (Left; Obtain right by tile mirroring)
;  byte 12 : PosY
;  byte 13 : PosX
;  byte 14 : Orientation (0=Front, 1=Back, 2=Left, 3=Right)
;  byte 15 : 0 = Static, 1 = Dynamic (adjustes orientation to player's position)
wMnpcData::
	DS 16*8 ; (Though I doubt I'll need 8 NPCs per map in this game)
	

SECTION "Scroll map in HRAM", HRAM

; Currrent map index
hMapIndex::
	DS 1
	
; Map Starting Point

hMapStartX::
	DS 1
hMapStartY::
	DS 1

; MC position on map
hMMCY::
	DS 1
hMMCX::
	DS 1
	
; the metaposition MC is faced to
hFaceToY::
	DS 1
hFaceToX::
	DS 1

SECTION "TileMap Index", ROM0, ALIGN[5]

TileMapsList::
	DW MAP_Lobby  ;  iMAP_Lobby
	
; Now let's write some code

SECTION "Tile map initializer", ROM0

TileMap_Init::
	xor a
	ldh [hMapIndex], a
	ldh [hMapStartX], a
	ldh [hMapStartY], a
	ldh [hMMCX], a
	ldh [hMMCY], a
	ldh [hFaceToX], a
	ldh [hFaceToY], a
	ret

SECTION "Tilemap Loader", ROM0

; loads the tilemap given the map index
; a = map index
TileMap_Load::
	; hl = TileMapsList + 2 * a
	rlca
	ld hl, TileMapsList
	or l
	ld l, a
	; hl = word address at [hl]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld de, $9800
	
	; now we need to copy tile map data
	; don't call loatMemorySTAT/loadMemoryDOUBLE, because we need hl as a source address
	; for faster memory access
	ld b, 0
.waitVRAM1
    ldh a, [rSTAT]
    and STATF_BUSY ; %0000_0010
    jr nz, .waitVRAM1
	ld a, [hli]       ; 2 cyc
	ld [de], a        ; 2 cyc
	inc de            ; 2 cyc
	ld a, [hli]       ; 2 cyc
	ld [de], a        ; 2 cyc
	inc de            ; 2 cyc
	dec b
	jr nz, .waitVRAM1
	
	ld b, 0
.waitVRAM2 ; one loop copies 512 bytes. Copy-paste it for 32x32=1024 bytes.
    ldh a, [rSTAT]
    and STATF_BUSY ; %0000_0010
    jr nz, .waitVRAM2
	ld a, [hli]       ; 2 cyc
	ld [de], a        ; 2 cyc
	inc de            ; 2 cyc
	ld a, [hli]       ; 2 cyc
	ld [de], a        ; 2 cyc
	inc de            ; 2 cyc
	dec b
	jr nz, .waitVRAM2
	
	; then the metadata
	
	ld de, wMapMetadata
	ld b, 0
.metaLoop
	ld a, [hli]       
	ld [de], a        
	inc de           
	dec b
	jr nz, .metaLoop
	
	; exit points
	
	ld a, [hli] ; exitPoints Count
	ld [wMapExitPointsCount], a
	
	ld de, wMapExitPoints
	
	; b = a * 5
	ld b, a
	sla a
	sla a
	add b
	ld b, a
.exitPtsLoop
	ld a, [hli]       
	ld [de], a        
	inc de           
	dec b
	jr nz, .exitPtsLoop

	; load NPCs etc...
	
	ret

SECTION "Tilemap Executer", ROM0

TileMap_Execute::
	
	ret
	
	

