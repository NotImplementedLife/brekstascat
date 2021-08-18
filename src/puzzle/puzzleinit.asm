INCLUDE "src/include/macros.inc"

SECTION "Puzzle List Address", WRAM0

wPuzzleListAddress::
	DS 2

SECTION "Puzzle init logic", ROM0

Puzzle_Init::
	xor a
	ld [rSCY], a
	ld [rSCX], a
	
	ld a, $C0
	ld [wSpritifyIndex], a
	
	; load puzzle chars from BANK 3
	
	setBank 3
	
	ld hl, wPuzzleCharTiles
	ld de, PuzzleCharTiles
	ld bc, PuzzleCharTilesEnd-PuzzleCharTiles
	call loadMemory
	
	setBank 4
	
	ld hl, $8900
	ld de, wPuzzleCharTiles
	ld bc, wPuzzleCharTilesEnd
	call loadMemoryDOUBLE
	
	; load graphics resources
	
	; [misplanning "fix"] load "empty" and ":"top/down tiles separately
	; $8C00-$8DF0 are used for spritifying rendering
	ld hl, $8BD0
	ld de, PuzzleUIDigitsTileset
	ld bc, PuzzleUIDigitsTileset + 3*16
	call loadMemoryDOUBLE
	; load the rest of the graphics
	
	ld hl, $8E00
	ld de, PuzzleUIDigitsTileset + 3*16
	ld bc, PuzzleUIDigitsTilesetEnd
	call loadMemoryDOUBLE
	
	ld hl, $8FC0
	ld de, PuzzleUITileset
	ld bc, PuzzleUITilesetEnd
	call loadMemoryDOUBLE
	
	ld hl, $9800
	ld de, PuzzleUITilemap
	ld bc, PuzzleUITilemap + 20
	call loadMemoryDOUBLE
	ld bc, 12
	add hl, bc
	
	ld de, PuzzleUITilemap + 20
	ld bc, PuzzleUITilemap + 40
	call loadMemoryDOUBLE
	
	ld b, 18
.tmLoop
	push bc
	ld bc, 12
	add hl, bc
	ld de, PuzzleUITilemap + 40
	ld bc, PuzzleUITilemap + 60
	call loadMemoryDOUBLE
	
	pop bc
	dec b
	jr nz, .tmLoop
	
	call waitForVBlank
	ld a, %00100111
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, %11111111
	ldh [rOBP1], a
	xor a
	ld  [rSCY], a
	ld  [rSCX], a
	
	ld hl, ShadowOAM
	ld bc, 160
	call fillMemory0
	initOAM ShadowOAM
	
	ld a, [wPuzzle_Size]
	cp 3
	jr nz, .skip3
	ld hl, _3x3_PuzzlesList
	jr .choosePuzListEnd
.skip3:
	cp 4
	jr nz, .skip4
	ld hl, _4x4_PuzzlesList
	jr .choosePuzListEnd
.skip4:
	cp 5
	jr nz, .skip5
	ld hl, _5x5_PuzzlesList
	jr .choosePuzListEnd
.skip5:
	; if not 3,4 or 5, then must be 6
	ld hl, _6x6_PuzzlesList	
.choosePuzListEnd
	
	;ld b,b
	ld a, [hli]
	ld b, a   ; list size
	push hl
	push bc
	call rand ; select a random puzzle from list
	pop bc
	pop hl
	
	; hl += a*4
	rlca
	rlca
	ld c, a
	ld b, 0
	add hl, bc
	
	; save hl for PuzzleLoadDataTilesetNoBorder
	ld a, h
	ld [wPuzzleListAddress], a
	ld a, l
	ld [wPuzzleListAddress+1], a
	
	push hl
	call PuzzleLoadDataTileset		
	pop hl
	
	inc hl ; skip bank
	inc hl ; skip HIGH
	
	; store SRAM address in WRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld a, h
	ld [wPuzzleSaveAddress], a
	ld a, l
	ld [wPuzzleSaveAddress+1], a
	
	; init sliding puzzle matrix
	ld a, 1
	ld b, 36
	ld hl, wSPMatrix
.matLoop
	ld [hli], a
	inc a
	dec b
	jr nz, .matLoop
	
	; replace the last piece with a 0 to create the empty square
	ld h, HIGH(wSPMatrix)
	ld a, [wPuzzle_MSize]
	dec a
	ld [wEmptyIndex], a ; store the empty square position
	ld l, a
	xor a
	ld [hl], a
	
	call PuzzleShuffle
	
	; update empty index
	; not necessary, because puzzle shuffler does not change it
	;ld a, [wPuzzle_MSize]
	;dec a
	;ld b, a
	;ld l, 0
	;ld hl, wSPMatrix
;.loop
	;ld a, [hl]
	;or a
	;jr z, .setEmptyIndex
	;inc l
	;dec b
	;jr nz, .loop
;.setEmptyIndex:
	;ld a, l
	;ld [wEmptyIndex], a
	
	; render puzzle
	ld a, [wPuzzle_Size]
	cp 3
	push af
	call z, PuzzleRenderFromMatrix3
	pop af
	cp 4
	push af
	call z, PuzzleRenderFromMatrix4
	pop af
	cp 5
	push af
	call z, PuzzleRenderFromMatrix5
	pop af
	cp 6
	push af
	call z, PuzzleRenderFromMatrix6
	pop af
	
	call waitForVBlank		
	call waitForVBlank		
	call rtcReset
	
	ret

; a = a*a
Sqr::
	push bc	
	ld c, a
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret
