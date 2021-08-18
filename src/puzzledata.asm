INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"

SECTION "Sliding Puzzle Data", ROM0

_3x3_PuzzlesList::
	
	DB 2  ; # of puzzles
	
	DB 5                    ; ROMX Bank number
	DB HIGH(SLP_MonaLisa_Tiles) ; Address where puzzle data starts
	DW SLP_test_HighScore   ; Address where time score is saved	
	
	DB 5                    ; ROMX Bank number
	DB HIGH(SLP_test_Tiles) ; Address where puzzle data starts
	DW SLP_test_HighScore   ; Address where time score is saved	

_4x4_PuzzlesList::
	DB 1
	
	DB 5                    
	DB HIGH(SLP_test_Tiles) 
	DW SLP_test_HighScore

_5x5_PuzzlesList::
	DB 1  

	DB 5                      
	DB HIGH(SLP_test80_Tiles) 
	DW SLP_test80_HighScore   


_6x6_PuzzlesList::
	DB 1
	
	DB 5                    
	DB HIGH(SLP_test_Tiles) 
	DW SLP_test_HighScore

SECTION "Sliding Puzzle Data Handling", ROM0

PuzzleLoadDataTilesetNoBorder::
	; need to obtain hl manually
	ld hl, wPuzzleListAddress
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	; load ROMX bank
	setBank [hli]		
	
	; get puzzle data address
	
	ld d, [hl]	
	ld e, 0
	ld c, e
	ld b, 9
	ld hl, wPuzzleOnTilemap
	call loadMemory
	setBank 4
	jp PuzzleCopyTileset

; hl = puzzle list data address
PuzzleLoadDataTileset::
	; load ROMX bank
	setBank [hli]		
	
	; get puzzle data address
	
	ld d, [hl]	
	ld e, 0
	ld c, e
	ld b, 9
	ld hl, wPuzzleOnTilemap
	call loadMemory
	
	setBank 4
	
	ld a, [wPuzzle_Size]
	cp 3
	push af
	call z, PuzzleLoadBorder3
	pop af	
	
	cp 4
	push af
	call z, PuzzleLoadBorder4
	pop af	
	
	cp 5
	push af
	call z, PuzzleLoadBorder5
	pop af	
	
	cp 6
	push af
	call z, PuzzleLoadBorder6
	pop af	
	
	ret
	
PuzzleLoadBorder3::
	ld b, HIGH(BorderMask3)
	jr PuzzleCopyTilesetWithBorder
	
PuzzleLoadBorder4::
	ld b, HIGH(BorderMask4)
	jr PuzzleCopyTilesetWithBorder
	
PuzzleLoadBorder5::
	ld b, HIGH(BorderMask5)
	jr PuzzleCopyTilesetWithBorder
	
PuzzleLoadBorder6::
	ld b, HIGH(BorderMask6)
	jr PuzzleCopyTilesetWithBorder
	
	
; copy tiles from wPuzzleOnTilemap to VRAM$9000=>$8800
PuzzleCopyTileset::
	; get first 128 tiles
	ld d, HIGH(wPuzzleOnTilemap)
	ld e, 0
	ld c, e
	ld a, d
	add 8
	ld b, a
	ld hl, $9000
	call loadMemoryDOUBLE	
		
	; get last 16 tiles
	inc b
	ld hl, $8800
	call loadMemoryDOUBLE		
	ret
	
; copy tileset but put the puzzle pieces in evidence
; b  = border address HIGH byte
PuzzleCopyTilesetWithBorder::
	ld de, wPuzzleOnTilemap
	ld c, 0
	
	ld a, $90
	ld [wBackupHL], a
	xor a
	ld [wBackupHL+1], a
	
	; solve VRAM$9000
	ld a, 8
.loop
	push af
	
	ld hl, wBorderFactory
	ld a, 128
.innerLoop
	push af	
	ld a, [bc] ; read border byte
	inc bc
	push bc
	
	cpl
	ld b, a
	
	ld a, [de] ; read tile byte
	inc de
	and b      ; retain thee part without border
	ld [hli], a ; temporary store
	ld a, [de]
	inc de
	and b
	ld [hli], a	
	
	pop bc
	
	pop af
	dec a
	jr nz, .innerLoop
		
	
	push de
	push bc
	ld de, wBorderFactory
	ld bc, wBorderFactory + 256
	ld hl, wBackupHL
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call loadMemoryDOUBLE	

	ld a, h
	ld [wBackupHL], a
	ld a, l
	ld [wBackupHL+1], a
	
	pop bc
	pop de	
	
	pop af
	dec a
	jr nz, .loop	
	
	; solve VRAM$8800
	ld hl, wBorderFactory
	ld a, 128
.lastLoop
	push af	
	ld a, [bc] ; read border byte
	inc bc
	push bc
	
	cpl
	ld b, a
	
	ld a, [de] ; read tile byte
	inc de
	and b      ; retain thee part without border
	ld [hli], a ; temporary store
	ld a, [de]
	inc de
	and b
	ld [hli], a	
	
	pop bc
	
	pop af
	dec a
	jr nz, .lastLoop
		
	ld de, wBorderFactory
	ld bc, wBorderFactory + 256
	ld hl, $8800
	call loadMemoryDOUBLE	
	
	
	ret
	
	
PuzzleDisplayFull::
	ld a, [wPuzzle_Size]
	cp 5
	jp z, PuzzleDisplayFull5
	jp PuzzleDisplayFull346	
	
PuzzleDisplayFull346:
	call waitForVBlank
	ld hl, $9884
	ld de, 20
	xor a
	ld b, 12
.loopRow:
	ld c, 12
	.loopCol:
		ld [hli], a
		inc a
		dec c
		jr nz, .loopCol
	add hl, de
	dec b
	jr nz, .loopRow	
	ret
	
PuzzleDisplayFull5:
	call waitForVBlank
	ld hl, $98A5
	ld de, 22
	xor a
	ld b, 10
.loopRow:
	ld c, 10
	.loopCol:
		ld [hli], a
		inc a
		dec c
		jr nz, .loopCol
	add hl, de
	dec b
	jr nz, .loopRow
	ret
	
SECTION "Sliding puzzle renderer", ROM0


PuzzleRenderFromMatrix3::	
	xor a
	ld hl, wSPMatrix
.loop
	ld b, a
	push af
	ld a, [hli]
	ld c, a
	push hl
	
	call PuzzlePutPiece3
	
	pop hl
	pop af
	inc a
	cp 9
	jr nz, .loop
	ret
	
; b = piece position in matrix (0-8)
; c = piece id (1-9, 0=empty)
PuzzlePutPiece3::
	ld a, b
	sla a
	ld e, a
	ld d, 0
	ld hl, PuzzleRendererPiecePos3
	add hl, de
	; hl = Piece position in VRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a	
	
	ld de, 28
	ld a, c
	or a
	jr nz, .normalPiece
.emptyPiece:
REPT(4)
	wait_vram
	ld a, $BD
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	add hl, de
ENDR
	ret
.normalPiece:
	dec c
	ld de, PuzzleRendererPieceTiles3
	; de = de + 16*c
	swap c
	ld a, c
	add e
	ld e, a
	ld a, 0
	adc a, d
	ld d, a
	
	ld b, 4
.outerLoop
	
	ld c, 2
	.innerLoop
		wait_vram
		ld a, [de]
		inc de
		ld [hli], a
		ld a, [de]
		inc de
		ld [hli], a
		dec c
		jr nz, .innerLoop
	
	push bc
	ld bc, 28
	add hl, bc
	pop bc
	
	dec b
	jr nz, .outerLoop
	
	ret
	
PuzzleRenderFromMatrix4::
	xor a
	ld hl, wSPMatrix
.loop
	ld b, a
	push af
	ld a, [hli]
	ld c, a
	push hl
	
	call PuzzlePutPiece4
	
	pop hl
	pop af
	inc a
	cp 16
	jr nz, .loop
	ret
	
; b = piece position in matrix (0-15)
; c = piece id (1-16, 0=empty)
PuzzlePutPiece4::
	ld a, b
	sla a
	ld e, a
	ld d, 0
	ld hl, PuzzleRendererPiecePos4
	add hl, de
	; hl = Piece position in VRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a	
	
	ld de, 29
	ld a, c
	or a
	jr nz, .normalPiece
.emptyPiece:
REPT(3)
	wait_vram
	ld a, $BD	
	ld [hli], a
	ld [hli], a
	ld [hli], a
	add hl, de
ENDR
	ret
.normalPiece:
	dec c
	ld de, PuzzleRendererPieceTiles4
	; de = de + 9*c
	
	ld a, c
	rlca
	rlca
	rlca
	add c
	add e
	ld e, a
	ld a, 0
	adc a, d
	ld d, a
	
	ld b, 3
.outerLoop
	
	ld c, 3
	.innerLoop
		wait_vram
		ld a, [de]
		inc de
		ld [hli], a		
		dec c
		jr nz, .innerLoop
	
	push bc
	ld bc, 29
	add hl, bc
	pop bc
	
	dec b
	jr nz, .outerLoop
	
	ret
	
PuzzleRenderFromMatrix5::
	xor a
	ld hl, wSPMatrix
.loop
	ld b, a
	push af
	ld a, [hli]
	ld c, a
	push hl
	
	call PuzzlePutPiece5
	
	pop hl
	pop af
	inc a
	cp 25
	jr nz, .loop
	ret
	
; b = piece position in matrix (0-24)
; c = piece id (1-25, 0=empty)
PuzzlePutPiece5::
	ld a, b
	sla a
	ld e, a
	ld d, 0
	ld hl, PuzzleRendererPiecePos5
	add hl, de
	; hl = Piece position in VRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a	
	
	ld de, 30
	ld a, c
	or a
	jr nz, .normalPiece
.emptyPiece:
	wait_vram
	ld a, $BD	
	ld [hli], a
	ld [hli], a
	add hl, de
	ld [hli], a
	ld [hli], a
	ret
.normalPiece:
	dec c
	ld de, PuzzleRendererPieceTiles5
	; de = de + 4*c
	
	ld a, c
	rlca
	rlca
	add e
	ld e, a
	ld a, 0
	adc a, d
	ld d, a
	
	ld b, 2
.outerLoop
	wait_vram
	ld a, [de]
	inc de
	ld [hli], a		
	ld a, [de]
	inc de
	ld [hli], a			
	
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	
	dec b
	jr nz, .outerLoop
	
	ret

PuzzleRenderFromMatrix6::
	xor a
	ld hl, wSPMatrix
.loop
	ld b, a
	push af
	ld a, [hli]
	ld c, a
	push hl
	
	call PuzzlePutPiece6
	
	pop hl
	pop af
	inc a
	cp 36
	jr nz, .loop
	ret

; b = piece position in matrix (0-35)
; c = piece id (1-36, 0=empty)
PuzzlePutPiece6::
	ld a, b
	sla a
	ld e, a
	ld d, 0
	ld hl, PuzzleRendererPiecePos6
	add hl, de
	; hl = Piece position in VRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a	
	
	ld de, 30
	ld a, c
	or a
	jr nz, .normalPiece
.emptyPiece:
	wait_vram
	ld a, $BD	
	ld [hli], a
	ld [hli], a
	add hl, de
	ld [hli], a
	ld [hli], a
	ret
.normalPiece:
	dec c
	ld de, PuzzleRendererPieceTiles6
	; de = de + 4*c
	
	ld a, c
	rlca
	rlca
	add e
	ld e, a
	ld a, 0
	adc a, d
	ld d, a
	
	ld b, 2
.outerLoop
	wait_vram
	ld a, [de]
	inc de
	ld [hli], a		
	ld a, [de]
	inc de
	ld [hli], a			
	
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	
	dec b
	jr nz, .outerLoop
	
	ret
	




	
	
	
	