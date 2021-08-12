INCLUDE "src/include/charmap.inc"

SECTION "Sliding Puzzle Data", ROM0

_3x3_PuzzlesList::
	
	DB 2  ; # of puzzles
	
	DB 5                  ; ROMX Bank number
	DW SLP_test           ; Address where puzzle data starts
	DW SLP_test_HighScore ; Address where time score is saved
	DB "Test            " ; 16-length string being the name of the puzzle
	
	DB 5                  ; ROMX Bank number
	DW SLP_test           ; Address where puzzle data starts
	DW SLP_test_HighScore ; Address where time score is saved
	DB "Test2           " ; 16-length string being the name of the puzzle

_4x4_PuzzlesList::
	

_5x5_PuzzlesList::

SECTION "Sliding Puzzle Data Handling", ROM0

PuzzleLoadData::
	
	ret
