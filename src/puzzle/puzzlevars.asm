SECTION "Puzzle vars", WRAM0

; where to save the high score
wPuzzleSaveAddress::
	DS 2

; Puzzle size (3, 4, 5 or 6)
; rendering differs depending on the type of puzzle
wPuzzle_Size::
	DS 1

; wPuzzle_MSize = wPuzzle_Size * wPuzzle_Size
wPuzzle_MSize::
	DS 1
	
SECTION "Puzzle on Tilemap", WRAM0, ALIGN[8]

wPuzzleOnTilemap::
	DS $900

SECTION "Puzzle vars X", WRAM0, ALIGN[8]	
; 16 tiles workspace for border rendering
wBorderFactory::
	DS 256
	
SECTION "Puzzle vars Backup HL", WRAM0
wBackupHL::
	DS 2
	
SECTION "Puzzle Matrix", WRAMX, ALIGN[8]
wSPMatrix::
	DS 36
