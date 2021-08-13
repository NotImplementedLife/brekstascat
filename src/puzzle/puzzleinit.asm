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
	
	ld hl, ShadowOAM
	ld bc, 160
	call fillMemory0
	initOAM ShadowOAM
	
	ld hl, _3x3_PuzzlesList+1
	call PuzzleLoadDataTileset	
	
	call PuzzleDisplayFull
	call waitForVBlank		
	ld b,b	
	
	ret

