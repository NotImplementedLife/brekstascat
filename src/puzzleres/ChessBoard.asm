; This file was generated automatically by BRKC_PuzzleMaker at 18-Sep-21 21:15:09.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_ChessBoard HighScore", SRAM

SLP_ChessBoard_HighScore::
  DS 3

SECTION "Sliding Puzzle ChessBoard", ROMX, BANK[3], ALIGN[8]

SLP_ChessBoard_Tiles::

DB $ff, $0c, $ff, $04, $ff, $06, $ff, $03, $ff, $01, $ff, $01, $ff, $00, $ff, $00
DB $f1, $0e, $e0, $1f, $e8, $17, $f8, $07, $f8, $07, $f9, $06, $fe, $01, $fe, $01
DB $08, $f7, $49, $b6, $41, $be, $40, $bf, $48, $b7, $03, $fc, $03, $fd, $07, $f9
DB $89, $76, $2e, $d1, $5f, $af, $7e, $b1, $f0, $6f, $e7, $98, $ed, $92, $fe, $01
DB $32, $cd, $86, $79, $ff, $00, $00, $ff, $00, $ff, $00, $f8, $40, $b0, $00, $f0
DB $51, $ae, $5f, $a0, $07, $f8, $00, $83, $00, $a0, $00, $3f, $00, $3f, $00, $3f
DB $80, $7f, $c1, $3e, $00, $ff, $00, $c0, $00, $c0, $00, $00, $00, $00, $00, $00
DB $00, $ff, $80, $7f, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $f9, $00, $07, $00, $01, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $3f, $00, $1f, $00, $1f
DB $00, $f0, $00, $f8, $00, $fc, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $33, $00, $31, $00, $07, $00, $07, $00, $c3, $00, $e0, $00, $f8, $00, $fe
DB $ff, $00, $ff, $00, $ff, $00, $ff, $c0, $ff, $e0, $ff, $e0, $ff, $f0, $ff, $f0
DB $fc, $03, $fe, $01, $fe, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $27, $da, $4f, $b6, $5f, $ac, $1f, $e8, $bf, $58, $bf, $70, $ff, $20, $ff, $60
DB $fe, $01, $ff, $00, $e0, $1f, $c0, $20, $80, $60, $80, $7c, $c0, $3f, $ff, $00
DB $40, $a0, $00, $f0, $20, $df, $00, $7f, $60, $1f, $78, $87, $fc, $03, $00, $a4
DB $00, $3f, $00, $7f, $00, $c1, $00, $c0, $00, $c0, $00, $c0, $00, $fc, $00, $ff
DB $00, $00, $00, $00, $00, $f8, $00, $fc, $00, $fc, $00, $fc, $00, $ff, $00, $03
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $fc
DB $00, $00, $00, $00, $00, $00, $00, $18, $00, $08, $00, $40, $00, $00, $00, $00
DB $00, $0f, $00, $07, $00, $07, $00, $03, $00, $01, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $f8, $ff, $fc, $ff, $fc, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $ff, $ff, $ff
DB $ff, $00, $ff, $01, $ff, $01, $ff, $03, $ff, $03, $ff, $07, $ff, $0f, $ff, $0f
DB $ff, $c0, $ff, $c0, $ff, $c1, $ff, $c3, $ff, $83, $ff, $cf, $ff, $f0, $f0, $ef
DB $ff, $00, $ff, $00, $fe, $01, $fe, $81, $fe, $c1, $fc, $c3, $fe, $01, $07, $f8
DB $00, $c0, $00, $c0, $00, $f0, $00, $f8, $00, $fb, $00, $fb, $e1, $1e, $fe, $01
DB $00, $ff, $00, $ff, $c0, $3f, $e0, $1f, $f0, $0f, $f8, $07, $80, $7f, $00, $81
DB $00, $03, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $ff, $00, $ff
DB $00, $fc, $00, $fe, $00, $fe, $00, $fe, $10, $ef, $58, $a7, $00, $ff, $00, $48
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $e0, $00, $ff
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $f0
DB $00, $7f, $00, $3f, $00, $1f, $00, $0f, $00, $0f, $00, $07, $00, $07, $00, $03
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $1f, $ff, $3f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $ef, $e0, $ff, $e0, $df, $c0, $ff, $c0, $bf, $c0, $bf, $a0, $5f, $80, $7f
DB $07, $f8, $07, $f8, $0f, $f4, $0f, $fe, $0f, $fe, $1f, $ef, $1f, $ef, $1f, $ff
DB $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fc, $83, $fc, $83
DB $00, $e1, $00, $e1, $00, $f9, $00, $fb, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $80, $7f, $c0, $3f, $e0, $1f, $e0, $1f, $f0, $0f
DB $00, $04, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80
DB $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $3f, $00, $3f, $02, $3d, $00, $1f
DB $00, $f8, $00, $fc, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f
DB $00, $03, $00, $01, $00, $00, $00, $80, $00, $c0, $00, $f0, $00, $fc, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $3f, $00, $1f, $00, $9f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $fe, $ff, $fe, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $00, $ff, $00, $ff, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $3f, $df, $3f, $cf, $ff, $00, $c0, $bf, $c0, $bf, $80, $ff, $80, $ff, $80, $7f
DB $fc, $c3, $fc, $e3, $ff, $00, $07, $f8, $07, $f8, $07, $f8, $07, $fc, $07, $fe
DB $00, $ff, $00, $ff, $c1, $3e, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $f8, $07, $ff, $00, $00, $ff, $00, $f8, $00, $fc, $00, $fc, $00, $ff, $00, $ff
DB $00, $88, $80, $60, $00, $ff, $00, $ff, $00, $7f, $30, $4f, $38, $47, $3c, $c3
DB $08, $37, $04, $9b, $00, $ff, $00, $f8, $00, $f8, $00, $fc, $00, $fc, $00, $fc
DB $60, $9f, $70, $8f, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $3f, $00, $1f, $00, $1f
DB $00, $cf, $00, $ff, $00, $f7, $00, $fb, $00, $fb, $00, $fd, $00, $ff, $00, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $fe, $fe, $ff, $fe, $ff, $fe, $fd, $fe, $fd, $ff, $fc
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $c0, $3f, $00, $ff, $60, $9f, $fe, $01
DB $0f, $f7, $0f, $f7, $0f, $f7, $0f, $ff, $0f, $ff, $0f, $ff, $0f, $ff, $1f, $ef
DB $ff, $00, $ff, $00, $ff, $c0, $ff, $c0, $ff, $f0, $ff, $e0, $ff, $f0, $ff, $fc
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $3f, $c0, $3f, $c0, $3f, $c0, $3f, $c0, $1f, $e0, $1f, $e0, $1f, $e0, $1f, $e0
DB $00, $fc, $80, $7e, $c0, $3e, $e0, $1e, $f8, $07, $f8, $07, $fe, $01, $ff, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $0f, $00, $0f, $00, $07, $00, $07, $00, $07, $00, $47, $00, $03, $00, $03
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f
DB $ff, $fe, $ff, $fe, $ff, $fc, $ff, $fc, $ff, $fc, $ff, $f8, $ff, $f8, $ff, $f0
DB $fc, $03, $fc, $03, $fe, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $07, $ff, $0f, $f7, $0f, $f7, $0f, $ff, $1f, $ef, $1f, $ff, $7f, $9f, $3f, $df
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $ef, $f0, $ef, $f0, $ef, $e0, $ff, $e0, $ff, $e0, $ff, $e0, $df, $e0, $df
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $ff, $c0, $ff, $e0, $ff, $e0
DB $f0, $0f, $e0, $1f, $e0, $1f, $f0, $0f, $f0, $0f, $f0, $0f, $f0, $0f, $f0, $0f
DB $00, $ff, $00, $ff, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $80, $7f, $40, $bf, $60, $9f, $70, $8f, $78, $87, $3e, $c1, $3f, $c0, $3f, $c0
DB $00, $ff, $01, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f
DB $00, $ff, $80, $7f, $88, $77, $f0, $0f, $72, $8d, $30, $cf, $18, $e7, $1d, $e2
DB $ff, $f0, $ff, $e0, $ff, $c0, $ff, $c0, $ff, $c0, $ff, $80, $ff, $80, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $bf, $7f, $ff, $3f, $ff, $3f, $7f, $ff, $ff, $7f, $ff, $7f, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $e0, $df, $e0, $df, $e0, $df, $c0, $ff, $c0, $ff, $c0, $ff, $e0, $9f, $e0, $9f
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $f0, $ff, $f8, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $0f, $f0, $0f, $f8, $07, $f8, $07, $f8, $07, $f8, $87, $f8, $c7, $f8, $c7
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $1f, $e0, $1f, $e0, $1f, $e0, $1f, $e0, $0f, $f0, $0f, $f0, $0f, $f0, $07, $f8
DB $c0, $3f, $e0, $1f, $f8, $07, $fc, $03, $fe, $01, $ff, $00, $ff, $00, $ff, $00
DB $0e, $f1, $0f, $f0, $0f, $f0, $07, $f8, $07, $f8, $07, $f8, $83, $7c, $f3, $0c
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $c0, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $e1, $1e, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ec, $ff, $e4, $ff, $fc, $ff, $f8, $ff, $f8, $ff, $fc, $ff, $fc
DB $f8, $e7, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $ff, $00, $ff, $00
DB $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $07, $f8, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $fb, $04, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff
DB $ff, $ff, $ff, $ff, $00, $07, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff
DB $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $c0
DB $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $01
DB $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
DB $ff, $ff, $ff, $ff, $c0, $3f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
DB $ff, $ee, $ff, $ef, $66, $99, $00, $00, $00, $00, $00, $00, $00, $00, $00, $78
DB $ff, $08, $ff, $00, $cf, $30, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $00, $ff, $00, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $00, $ff, $00, $03, $fc, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $e0, $ff, $f0, $ff, $f8, $ff, $fa, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $f9, $06, $fc, $03, $fc, $03, $fe, $01, $fe, $01, $fe, $01, $ff, $00, $ff, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $00, $ff, $80, $ff, $80, $ff, $80, $ff, $c0, $ff, $c0, $ff, $e0, $ff, $f0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $ff, $c0, $3f, $c8, $37, $c8, $37, $c0, $3f, $e0, $1f, $f0, $0f, $f2, $0d
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff


SLP_ChessBoard_Text::
DB " Chess Board  "
