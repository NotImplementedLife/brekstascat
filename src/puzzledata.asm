INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"

SECTION "Sliding Puzzle Data", ROM0

_3x3_PuzzlesList::
	
	DB 2  ; # of puzzles
	
	DB 5                    ; ROMX Bank number
	DB HIGH(SLP_test_Tiles) ; Address where puzzle data starts
	DW SLP_test_HighScore   ; Address where time score is saved	
	
	DB 5                    ; ROMX Bank number
	DB HIGH(SLP_test_Tiles) ; Address where puzzle data starts
	DW SLP_test_HighScore   ; Address where time score is saved	

_4x4_PuzzlesList::
	

_5x5_PuzzlesList::

SECTION "Sliding Puzzle Data Handling", ROM0

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
	
	call PuzzleCopyTileset
	
	ld b, HIGH(BorderMask6)
	call PuzzleCopyTilesetWithBorder
	
	ret
	
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
	
PuzzleDisplayFull346::
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
	
PuzzleDisplayFull5::
	ret
	
	
; de = address of border mask
PuzzleApplyBorderMask::	
	ld hl, $9000
	
	ld a, [de]
	inc de
	
	ret
	
	
	
	
	
	
	
	
	
	