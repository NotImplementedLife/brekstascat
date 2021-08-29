INCLUDE "src/include/macros.inc"

SECTION "Ending Main", ROM0

EndingMain::
	call clearVRAM
	
	setBank 7
	
	; Ok, this is tricky
	; so I only need to scroll down a 16x64 tiles static image.
	; The tiles are directly copy-pasted to VRAM, from ROM7,
	; e.g. tiles at $8000-$8100 represent the first row to be displayed etc.
	; There are 18 rows in total, so I need to change LCDC bit 4 in order to
	; display all the tiles
	
	; I must have a not used row in VRAM to make sure the tilemap's empty margins 
	; don't mess up while dinamically loading tiles
	; particularly, $FF will be the blank tile
	ld hl, $9800
	ld b, $FF
	ld c, 0
.loopFF
	ldh a, [rSTAT]
    and STATF_BUSY ; %0000_0010
    jr nz, .loopFF
	ld a, b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loopFF
	
	ldh a, [rSTAT]
	or $40
	ldh [rSTAT], a
	
	ld a, [rIE]
	or 2
	ld [rIE], a ; Enable STAT interrupt
	
	
	jr @