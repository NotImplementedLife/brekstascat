INCLUDE "src/include/macros.inc"

SECTION "Puzzle init logic", ROMX, BANK[4]

Puzzle_Init::
	; load graphics resources
	ld hl, $8DD0
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
	
	ld a, [hli]
	ld b, a   ; list size
	call rand ; select a random puzzle from list
	
	; hl += a*5
	ld b, a
	rlca
	rlca
	add b	
	ld c, a
	ld b, 0
	add hl, bc
	
	call PuzzleLoadDataTileset		
	
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
	ld l, a
	xor a
	ld [hl], a
		
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
