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
	ld de, EndingTilemapData
	ld b, 0
	ld c, 32
.loopTilemap
	call waitForVBlank
	ld a, $FF
	ld [hli], a
	ld [hli], a
	ld a, [de]
	inc e
	REPT(16)
	ld [hli], a
	inc a
	ENDR
	ld a, $FF
	ld [hli], a
	ld [hli], a
	push bc
	ld bc, 12
	add hl, bc
	pop bc
	dec c
	jr nz, .loopTilemap
	
	xor a
	ld [EndingScrollY], a
	ld [EndingCompensateY], a
	ld [EndingPaletteReady], a
	
	;ld a, %11100100
	xor a
	ld [rBGP], a
	
	ld hl, $4000
	
	ld d, 19
.loadFirstRows
	call waitForVBlank
	call EndingNextRow1
	call waitForVBlank
	call EndingNextRow2
	ld a, [EndingScrollY]
	inc a
	ld [EndingScrollY], a
	dec d
	jr nz, .loadFirstRows
	
	ldh a, [rSTAT]
	or $40
	ldh [rSTAT], a
	
	ld a, [rIE]
	or 2
	ld [rIE], a ; Enable STAT interrupt
	
	ld c, 10
.loop0
	call waitForVBlank
	dec c
	jr nz, .loop0
	ld a, %01000000
	ldh [rBGP], a
	
	ld c, 10
.loopA
	call waitForVBlank
	dec c
	jr nz, .loopA
	ld a, %01010000
	ldh [rBGP], a
	
	ld c, 10
.loop1
	call waitForVBlank
	dec c
	jr nz, .loop1
	ld a, %10010000
	ldh [rBGP], a
	
	ld c, 10
.loopB
	call waitForVBlank
	dec c
	jr nz, .loopB
	ld a, %10010100
	ldh [rBGP], a

	ld c, 10
.loopC
	call waitForVBlank
	dec c
	jr nz, .loopC
	ld a, %10100100
	ldh [rBGP], a
	
	ld c, 10
.loop2
	call waitForVBlank
	dec c
	jr nz, .loop2
	ld a, %11100100
	ldh [rBGP], a
	
	ld c, 30
.loop3
	call waitForVBlank
	dec c
	jr nz, .loop3
	
	
.llp
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	call waitForVBlank
	call waitForVBlank
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	call waitForVBlank
	
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	call EndingNextRow1
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	call waitForVBlank
	call waitForVBlank
	call EndingNextRow2
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	or a
	call z, compensate
	
	ld a, [EndingScrollY]
	inc a
	ld [EndingScrollY], a
	;ld b,b
	
	jp .llp
	
compensate:
	ld a, [EndingCompensateY]
	add 32
	ld [EndingCompensateY], a
	ret

	
	
	
SECTION "Ending Tilemap Data", ROM0, ALIGN[8]

; used to generate tilemap
EndingTilemapData::
	DB $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $A0, $B0, $C0, $D0, $E0, $00, $10, $20
	DB $30, $40, $50, $60, $70, $00, $10, $20, $30, $40, $50, $60, $70, $80
	DB $90, $A0, $B0, $C0, $D0, $E0, $00, $10, $20, $30, $40, $50, $60, $70
	DB $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $A0, $B0, $C0, $D0, $E0, $00, $10, $20
	DB $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0,
	
SECTION "Ending L4 Data", ROM0, ALIGN[8]

; used to know which LCDC bit 4 should use
EndingRowData::
	DB $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $00, $00, $00
	DB $00, $00, $00, $00, $00, $10, $10, $10, $10, $10, $10, $10, $10, $10
	DB $10, $10, $10, $10, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00,
	DB $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $00, $00, $00
	DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
SECTION "Ending Row Addresses", ROM0, ALIGN[8]

; HIGH(where to dump each 16-tiles row in VRAM)
EndingRowAddresses::
	DB $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $90, $91, $92
	DB $93, $94, $95, $96, $97, $80, $81, $82, $83, $84, $85, $86, $87, $88
	DB $89, $8A, $8B, $8C, $8D, $8E, $90, $91, $92, $93, $94, $95, $96, $97
	DB $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $90, $91, $92
	DB $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $FF
	
SECTION "Tile Stream", ROM0

EndingNextRow1::
	ld a, [EndingScrollY]
	ld b, HIGH(EndingRowAddresses)
	ld c, a
	ld a, [bc]
	;ld b,b
	cp $FF
	jp z, endGame
	ld b, a
	ld c, 0
	
	ld e, 32
.loop
	ld a, [hli]
	ld [bc], a
	inc c
	
	ld a, [hli]
	ld [bc], a
	inc c
	
	ld a, [hli]
	ld [bc], a
	inc c
	
	ld a, [hli]
	ld [bc], a
	inc c
	
	dec e
	jr nz, .loop
	
	;ld b,b
	; set tilemap
	ld a, [EndingScrollY]
	ld b, HIGH(EndingTilemapData)
	ld c, a
	ld a, [bc] ; tileset row
	ld b, a

	ld a, [EndingScrollY]
	and 31
	; de = a * $20 = a * 2 * $10
	sla a
	swap a
	
	push de
	ld d, a
	and $F0
	ld e, a
	ld a, d
	and $0F;
	ld d, a
	
	push hl
	ld hl, $9802
	add hl, de
	ld d, h
	ld e, l
	pop hl
	
	ld a, b
	ld c, 8
.lp
	ld [de], a
	inc a
	inc de
	
	ld [de], a
	inc a
	inc de
	
	dec c
	jr nz, .lp
	
	pop de
	
	ret
	
EndingNextRow2::
	ld a, [EndingScrollY]	
	ld b, HIGH(EndingRowAddresses)
	ld c, a
	ld a, [bc]
	ld b, a
	ld c, $80
	
	ld e, 64
.loop
	ld a, [hli]
	ld [bc], a
	inc c
	
	ld a, [hli]
	ld [bc], a
	inc c
	
	dec e
	jr nz, .loop
	
	ret
	
SECTION "End Game", ROM0

endGame:
	ld c, 100
.loop
	call waitForVBlank
	dec c
	jr nz, .loop
	; this marks the end of game
	; nothing is done rn
	ld b,b
	jr @
	
SECTION "Ending Vars", WRAM0
	
EndingPaletteReady::
	DS 1
	
EndingScrollY::
	DS 1
	
EndingCompensateY::
	DS 1



	