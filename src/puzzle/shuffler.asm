SECTION "Puzzle Shuffler", ROM0

PuzzleShuffle::
ld a, 26
.loop:
	push af
	
	ld a, [wPuzzle_MSize]
	dec a ; ignore the 0 at the end
	
	ld b, a
	push bc
	call rand
	pop bc
	
	ld c, a
	
	ld a, l
	call DivAB
	ld b, e 
	
	; impose b != c to assure the puzzle is solvable
	ld a, b
	cp c
	jr nz, .ok
	
	cp 0
	jr z, .inc
	dec b
	jr .ok
.inc
	inc b	
.ok
	call PuzMatrixSwapEntries
	
	pop af
	dec a
	jr nz, .loop
	
	ret
