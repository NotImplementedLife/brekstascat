; a little scrollmap engine
; map size is 16x16 and cosists of 256 2x2 metatiles

INCLUDE "src/include/macros.inc"

SECTION "Scroll map Metadata", WRAM0, ALIGN[8]

; wMapMetadata
; byte at offset 16*y+x tells the following about the position (x,y)
; bit 0 : 0 = can walk on, 1 = barrier
; bit 1 : 0 = free, 1 = occupied by an NPC
; bit 2 : event launch method (0 = on tile step, 1 = on key A pressed)
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
; An exit points ($YX, $MM, $Y'X', $oo) tells the program to exit the map when character steps on (X, Y) 
; and load map at index $MM with the character at position (X', Y') oriented $oo
; Optimization hint: wMapExitPoints will be $X0 + 1
wMapExitPoints::
	DS 4*8 ; 8 is more than enough, I suppose
	
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

	
; check if player can move towards LookingAt tile (0=yes, non-0 = no)
hIsValidStep::
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
; hMMCO : 0=front, 1=back, 2=left, 3=right
hMMCO::
	DS 1
	
; the metaposition MC is faced to
hLookingAtY::
	DS 1
hLookingAtX::
	DS 1
	
; MC pixel position on map
; used in rendering
hPMCY::
	DS 1
hPMCX::
	DS 1
	
; Step Parity Counter
; increments on each step
; Tells whether to use MCP_FrontW or MCP_FrontS presets
hStepParity::
	DS 1
	
hCurrentMetaBackup::
	DS 1

SECTION "TileMap Index", ROM0, ALIGN[5]

TileMapsList::
	DW MAP_Lobby  ;  iMAP_Lobby
	
; Now let's write some code

SECTION "Tile map initializer", ROM0

;--------------------------------------------------------------
TileMap_Init::
;--------------------------------------------------------------
	; set Lobby as the default map
	xor a
	ldh [hMapIndex], a
	; set map metaposition
	ldh [hMapStartO], a ; facing front
	ld a, 3
	ldh [hMapStartY], a
	ld a, 7
	;ld a, 4
	ldh [hMapStartX], a
	; init the rest of the variables, they will be 
	; updated on render
	xor a
	ldh [hMMCX], a
	ldh [hMMCY], a
	ldh [hLookingAtX], a
	ldh [hLookingAtY], a
	ldh [hPMCX], a
	ldh [hPMCY], a
	ldh [hStepParity], a
	ret

SECTION "Tilemap Loader", ROM0

; loads the tilemap given the map index
; a = map index
;--------------------------------------------------------------
TileMap_Load::
;--------------------------------------------------------------
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
	
	; b = a * 4
	ld b, a
	sla b
	sla b
.exitPtsLoop
	ld a, [hli]       
	ld [de], a        
	inc de           
	dec b
	jr nz, .exitPtsLoop
	
	; mActions
	ld de, wMActions
	
	ld b, 64
.mActionsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .mActionsLoop

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
	
	; a*=3, prepare MC Preset
	ld b, a
	sla a
	add b
	ld [wMC_Preset], a
	
	
	ret

SECTION "Tilemap Executer", ROM0

; steps to execute per frame
;--------------------------------------------------------------
TileMap_Execute::
;--------------------------------------------------------------
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
	call nc, TileMap_SolveForXOver168
	
	; update map position (MMCY = PMCY/16 ; MMCX = (PMCX-8)/16)
	ldh a, [hPMCY]
	swap a
	and $0F
	ldh [hMMCY], a
	ldh a, [hPMCX]
	sub 8
	swap a
	and $0F
	ldh [hMMCX], a
	
	; update LookingAtXY
	ldh a, [hMMCO]
	or a
	jr z, .orientationFront
	cp a, 1
	jr z, .orientationBack
	cp a, 2
	jr z, .orientationLeft
	cp a, 3
	jr z, .orientationRight
	
.orientationFront:
	ld b, 1
	ld c, 0
	jr .orientationEnd
.orientationBack:
	ld b, -1
	ld c, 0
	jr .orientationEnd
.orientationLeft:
	ld b, 0
	ld c, -1
	jr .orientationEnd
.orientationRight:
	ld b, 0
	ld c, 1
.orientationEnd:
	ldh a, [hMMCY]
	add b
	ldh [hLookingAtY], a
	
	ldh a, [hMMCX]
	add c
	ldh [hLookingAtX], a
	
	call TileMap_GetLookingAtMetadata
	and 3
	ld [hIsValidStep], a
	
	; current position events checkup
	ld a, [MCMovQEnabled]
	or a
	jr nz, .skipCurrentPosEventCheck
	call TileMap_GetCurrentPosMetadata
	bit 2, a 
	call z, TM_MC_ExecuteMAction

	; exitpoints check
	call TM_ExitPoints_Check
	
.skipCurrentPosEventCheck:
	
	
	
	; check MovQ
	xor a
	ld [MCMovQNextFrameInterrupt], a ; reset MovQ frame interrupt
	REPT(19)
	call MovQueueProcess
	ENDR
	
	call waitForVBlank
	call MC_Display
	
	ld a, [MCMovQEnabled]
	or a
	ret nz ; don't check input while MovQ executing
	
	;call waitForVBlank
	call updateJoypadState
	ld a, [wJoypadState]
	and a, PADF_UP
	call nz, TM_MC_CommandUp
	
	ld a, [wJoypadState]
	and a, PADF_DOWN
	call nz, TM_MC_CommandDown
	
	ld a, [wJoypadState]
	and a, PADF_LEFT
	call nz, TM_MC_CommandLeft
	
	ld a, [wJoypadState]
	and a, PADF_RIGHT
	call nz, TM_MC_CommandRight
	
	ld a, [wJoypadPressed]
	and a, PADF_A
	call nz, TM_MC_ExecuteMActionOnAKey
	
	ret	

SECTION "Tilemap Pixel Position Solver", ROM0
	
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

TileMap_SolveForXOver168:
	sub 88
	ld [wMC_ScreenX], a
	ld a, 96
	ld [rSCX], a
	ret
	
TileMap_GetLookingAtMetadata:
	; get index of position LookingAt(Y,X)
	ld hl, hLookingAtY
	ld a, [hli] ; a = [hLookingAtY]
	swap a      ;     * 16
	add [hl]    ;     + [hLookingAtX]
	ld l, a
	
	ld h, HIGH(wMapMetadata)
	
	; finally, retrieve the value
	ld a, [hl]
	ret
	
TileMap_GetCurrentPosMetadata:
	ld hl, hMMCY ; this is the only difference
	ld a, [hli]
	swap a
	add [hl]
	ld l, a
	ld h, HIGH(wMapMetadata)
	ld a, [hl]
	ret
	

SECTION "Tilemap command placer", ROM0

TM_MC_CommandUp::
	; before making any steps, make the orientation match the direction of walking
	ld de, MovQInstr_PositionUp
	ld a, [hMMCO]
	cp 1
	ld a, 1
	ldh [hMMCO], a
	jp nz, MovQueueLaunch
	
	; if orientation is the same, proceed walking	
	ld de, MovQInstr_Up
	jp MovQueueLaunch
	
TM_MC_CommandDown::
	ld de, MovQInstr_PositionDown
	ld a, [hMMCO]
	cp 0
	ld a, 0
	ldh [hMMCO], a
	jp nz, MovQueueLaunch
	
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
TM_MC_CommandLeft::
	ld de, MovQInstr_PositionLeft
	ld a, [hMMCO]
	cp 2
	ld a, 2
	ldh [hMMCO], a
	jp nz, MovQueueLaunch

	ld de, MovQInstr_Left
	jp MovQueueLaunch
	
TM_MC_CommandRight::
	ld de, MovQInstr_PositionRight
	ld a, [hMMCO]
	cp 3
	ld a, 3
	ldh [hMMCO], a
	jp nz, MovQueueLaunch
	
	ld de, MovQInstr_Right
	jp MovQueueLaunch
	
TM_MC_ExecuteMActionOnAKey:
	call TileMap_GetLookingAtMetadata
	bit 2, a 
	ret z
TM_MC_ExecuteMAction:
	; build the index in wMActions
	ld hl, wMActions
	
	; a = (a/8)*2 <=> a = (a/4) & 0b11111110 ==> 0b00UUUUU0
	sra a
	sra a
	and $FE
	add l
	ld l, a
	
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp CallHL
	
SECTION "Tilemap exit points logic", ROM0

TM_ExitPoints_Check::
	; a = 16* MMCY + MMCX
	ld hl, hMMCY
	ld a, [hli]
	swap a
	ld l, [hl]
	add l
	
	ld c, a ; current position
	ld hl, wMapExitPointsCount
	ld b, [hl]
	ld hl, wMapExitPoints
	ld de, 3
.loop
	ld a, [hli]
	cp c ; if current position is among exit points
	jr z, TM_ExitPoint_Process
	add hl, de
	dec b
	jr nz, .loop
	ret
	
TM_ExitPoint_Process:: 
	ld a, [hli] ; map index
	ldh [hMapIndex], a
	ld a, [hli] ; mapYX
	ld b, a
	ld c, a
	
	ld a, b
	swap a
	and $0f
	ld [hMapStartY], a
	
	ld a, c
	and $0f
	ld [hMapStartX], a
	
	ld a, [hli] ; Orientation
	ld [hMapStartO], a
	
	ldh a, [hMapIndex]
	call TileMap_Load
	ret
	
	