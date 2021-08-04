; a little scrollmap engine
; map size is 16x16 and cosists of 256 2x2 metatiles

INCLUDE "src/include/macros.inc"

SECTION "Scroll map Metadata", WRAM0, ALIGN[8]

; wMapMetadata
; byte at offset 16*y+x tells the following about the position (x,y)
; bit 0 : 0 = barrier, 1 = can walk on
; bit 1 : 0 = free, 1 = occupied by an NPC
; bit 2 : event launch method (0=on tile step, 1 = on key A pressed)
; bits 3-7 : the last 5 bits of an address pointing to an action/event (wMActions)
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
hMapStartO::
	DS 1

; MC position on map
; these will be checked in order to fire events
hMMCY::
	DS 1
hMMCX::
	DS 1
hMMCO::
	DS 1
	
; the metaposition MC is faced to
hFaceToY::
	DS 1
hFaceToX::
	DS 1
	
; MC pixel position on map
; used in rendering
hPMCY::
	DS 1
hPMCX::
	DS 1

SECTION "TileMap Index", ROM0, ALIGN[5]

TileMapsList::
	DW MAP_Lobby  ;  iMAP_Lobby
	
; Now let's write some code

SECTION "Tile map initializer", ROM0

TileMap_Init::
	; set Lobby as the default map
	xor a
	ldh [hMapIndex], a
	; set map metaposition
	ldh [hMapStartO], a ; facing front
	ld a, 3
	ldh [hMapStartY], a
	;ld a, 7
	ld a, 4
	ldh [hMapStartX], a
	; init the rest of the variables, they will be 
	; updated on render
	xor a
	ldh [hMMCX], a
	ldh [hMMCY], a
	ldh [hFaceToX], a
	ldh [hFaceToY], a
	ldh [hPMCX], a
	ldh [hPMCY], a
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
	
	; load pixel position & orientation
	ldh a, [hMapStartY]
	swap a
	ldh [hPMCY], a
	ldh a, [hMapStartX]
	swap a
	add 8
	ldh [hPMCX], a
	ldh a, [hMapStartO]
	ldh [hMMCO], a
	
	
	ret

SECTION "Tilemap Executer", ROM0

; steps to execute per frame
TileMap_Execute::
	; get MC position
	call waitForVBlank
	; solve for screenY coordinate
	ldh a, [hPMCY]
	cp 64
	push af
	call c, TileMap_SolveForYUnder64
	pop af
	push af
	call nc, TileMap_SolveForYOver64
	pop af
	cp 178
	call nc, TileMap_SolveForYOver178
	
	;solve for screenX coordinate
	ldh a, [hPMCX]
	cp 72
	push af
	call c, TileMap_SolveForXUnder72
	pop af
	push af
	call nc, TileMap_SolveForXOver72
	pop af
	cp 168
	call nc, TileMap_SolveForXOver194
	
	
	call waitForVBlank
	call MC_Display
	call waitForVBlank
	call updateJoypadState
	ld a, [wJoypadState]
	and a, PADF_DOWN
	call nz, TM_incMMCY
	ld a, [wJoypadState]
	and a, PADF_UP
	call nz, TM_decMMCY
	ld a, [wJoypadState]
	and a, PADF_LEFT
	call nz, TM_decMMCX
	ld a, [wJoypadState]
	and a, PADF_RIGHT
	call nz, TM_incMMCX
	
	ret
	
TM_incMMCY:
	ldh a,[hPMCY]
	inc a
	inc a
	cp 256-16
	ret z
	ldh [hPMCY], a
	ret
	
TM_decMMCY:
	ldh a,[hPMCY]
	dec a
	dec a
	cp $FE
	ret z
	ldh [hPMCY], a
	ret
	
TM_incMMCX:
	ldh a,[hPMCX]
	inc a
	inc a
	cp 256-16
	ret z
	ldh [hPMCX], a
	ret
	
TM_decMMCX:
	ldh a,[hPMCX]
	dec a
	dec a
	cp $FE
	ret z
	ldh [hPMCX], a
	ret
	
	
TileMap_SolveForYUnder64:
	add 16
	ld [wMC_ScreenY], a
	xor a
	ld [rSCY], a
	ret
	
TileMap_SolveForYOver64:
	sub 64
	ldh [rSCY], a
	ld a, $50
	ld [wMC_ScreenY], a
	ret

TileMap_SolveForYOver178:
	sub 96
	ld [wMC_ScreenY], a
	ld a, 112
	ld [rSCY], a
	ret

TileMap_SolveForXUnder72:
	add 8
	ld [wMC_ScreenX], a
	xor a
	ld [rSCX], a
	ret
	
TileMap_SolveForXOver72:
	sub 72
	ldh [rSCX], a
	ld a, 80
	ld [wMC_ScreenX], a
	ret

TileMap_SolveForXOver194:
	sub 88
	ld [wMC_ScreenX], a
	ld a, 96
	ld [rSCX], a
	ret
	
	
	
	
	
	
	
	