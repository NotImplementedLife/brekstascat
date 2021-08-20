; This file was generated automatically by BRKC_PuzzleMaker at 19-Aug-21 10:29:43.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_kitty HighScore", SRAM

SLP_kitty_HighScore::
  DS 3

SECTION "Sliding Puzzle kitty", ROMX, BANK[5], ALIGN[8]

SLP_kitty_Tiles::

DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fd, $fc, $fb, $fc, $fb
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1f, $3f, $cf, $1f, $ef, $4f, $bf, $cf, $37
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $c0, $ff, $c0, $ff, $80, $ff, $80, $ff, $80, $bf, $c0, $ff, $81, $ff, $07
DB $ff, $7f, $ff, $3f, $ff, $1f, $ff, $0f, $ff, $1f, $ff, $7f, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $df, $ff, $ee, $ff, $e1, $f7, $eb, $ef, $d3, $ff, $db, $ff, $fd
DB $fd, $fa, $fd, $fa, $f9, $f6, $f9, $f6, $f8, $f7, $f8, $f7, $f9, $f6, $f9, $c6
DB $ef, $13, $ff, $01, $ff, $40, $f0, $2f, $e0, $13, $c0, $3f, $80, $78, $10, $e8
DB $ff, $ff, $ff, $ff, $ff, $0f, $07, $f9, $01, $f8, $c8, $14, $78, $04, $38, $36
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $3f, $cf, $07, $1b, $03, $29
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $1f, $ff, $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $cf, $e0, $df, $c0, $fb, $c0, $ff, $c0, $ef, $c0, $ff, $c1, $be, $c0, $bb
DB $08, $94, $02, $85, $01, $ea, $04, $fb, $3f, $cc, $ff, $1f, $7f, $8f, $7f, $be
DB $38, $96, $10, $2f, $03, $84, $01, $e2, $e0, $40, $e0, $d0, $c3, $24, $83, $4d
DB $00, $6d, $60, $80, $e0, $0c, $c8, $b4, $00, $82, $00, $03, $00, $a3, $90, $6b
DB $ff, $ff, $ff, $7f, $3f, $7f, $3f, $1f, $1f, $3f, $0f, $70, $00, $03, $00, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $1f, $ef, $0f, $1f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $c2, $e5, $c0, $fd, $e0, $d0, $e0, $d0, $e0, $d0, $c0, $f0, $c0, $e0, $e0, $c0
DB $ff, $3c, $ff, $1c, $7f, $bf, $1f, $67, $0f, $b3, $07, $3b, $03, $1d, $01, $5e
DB $07, $e9, $e7, $19, $f7, $c8, $f3, $ec, $fb, $e4, $f8, $e7, $f8, $c7, $78, $87
DB $86, $40, $c0, $23, $c0, $20, $c0, $20, $80, $68, $00, $86, $00, $88, $00, $00
DB $00, $10, $00, $30, $00, $07, $00, $1b, $01, $06, $03, $1d, $07, $1b, $1f, $2f
DB $0f, $3f, $1f, $3f, $3f, $7f, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff
DB $c0, $e0, $c0, $c0, $c0, $80, $80, $c1, $80, $c3, $00, $c0, $00, $81, $00, $00
DB $00, $3f, $00, $bf, $00, $fb, $00, $f8, $00, $f0, $00, $f8, $10, $e8, $00, $38
DB $00, $6e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $1f, $00, $1f, $0f, $1f, $0f, $1f, $3f, $1f, $3f
DB $1f, $3f, $3f, $1f, $7f, $ff, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fd, $fc, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fd, $f9, $27
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fe, $fc, $fc, $fe, $fc, $fe, $fc, $f8, $fc, $f8, $f8, $fe, $f8, $fe, $f8, $f7
DB $00, $01, $00, $01, $00, $01, $00, $00, $00, $01, $00, $03, $00, $03, $00, $87
DB $00, $78, $00, $e0, $00, $60, $00, $20, $00, $c0, $00, $c0, $00, $80, $00, $c0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $1f, $2f, $1f, $2f, $0f, $3f, $0f, $7f, $0f, $0f, $0f, $07, $07, $0f, $07, $ef
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fc, $ff, $ff, $fc, $ff, $fc, $ff, $fc, $fd, $fa, $fb, $f4, $f7, $e8, $ff, $f0
DB $11, $ef, $71, $8f, $f9, $07, $fd, $02, $ff, $00, $fd, $02, $f9, $06, $f9, $06
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $3f, $ff, $7f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $f8, $ff, $f9, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff
DB $ff, $ff, $f5, $8b, $ff, $09, $ff, $fb, $ff, $fb, $ff, $73, $ff, $37, $ff, $b7
DB $f8, $f7, $f0, $fe, $f0, $ec, $f0, $ec, $f0, $ec, $f2, $ed, $f3, $ec, $f0, $ef
DB $00, $07, $00, $0f, $00, $07, $00, $17, $00, $0f, $00, $83, $00, $c3, $00, $9e
DB $00, $c0, $00, $c2, $00, $e0, $00, $e0, $00, $f0, $00, $e0, $00, $e0, $00, $f0
DB $00, $00, $00, $0c, $00, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7f
DB $07, $47, $07, $27, $07, $43, $03, $07, $03, $61, $01, $23, $00, $31, $00, $20
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $e7, $1b, $8f, $77, $df, $af, $df, $ef, $ff, $df, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $c7, $ef, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $e8, $f0, $ec, $fe, $f1, $fe, $f9, $ff, $f8, $fd, $fa, $f8, $fe, $f8, $fc
DB $02, $05, $03, $0c, $00, $ef, $00, $cf, $c0, $3f, $8d, $72, $02, $dd, $03, $0c
DB $00, $f8, $00, $f8, $20, $d4, $e0, $1c, $00, $fe, $c0, $3c, $e0, $1e, $e0, $1e
DB $00, $e0, $00, $20, $00, $00, $00, $00, $00, $06, $00, $03, $00, $0f, $00, $00
DB $00, $c0, $00, $30, $00, $38, $00, $10, $00, $00, $00, $00, $00, $80, $00, $58
DB $7f, $ff, $7f, $7f, $3f, $7f, $3f, $1f, $1f, $0f, $0f, $0f, $07, $07, $03, $03
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $07, $fb, $fb, $07, $fb, $ff, $ff, $f9, $fd, $fb
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f8, $f7, $f1, $fa, $fb, $f4, $fb, $f4, $f9, $f7, $f9, $f6, $fd, $f2, $fc, $f3
DB $01, $0e, $01, $8e, $81, $46, $80, $47, $81, $62, $80, $63, $80, $63, $00, $20
DB $e0, $1e, $f0, $2e, $f0, $28, $f0, $e0, $f0, $60, $70, $82, $20, $df, $60, $9f
DB $00, $00, $00, $00, $00, $00, $00, $20, $00, $0f, $00, $dd, $00, $cf, $00, $4c
DB $00, $28, $00, $00, $00, $00, $00, $00, $00, $00, $00, $88, $00, $80, $00, $00
DB $01, $03, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $7f, $3f, $1f, $0f, $07, $07, $03, $07
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fd, $ff, $ff, $fc, $ff, $fc, $fb, $fd, $f7, $ef, $6f, $9f, $bf, $5f, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f8, $f6, $f8, $fc, $fc, $f8, $fc, $fe, $fe, $fd, $fe, $ff, $fe, $fc, $fc, $fe
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $c0, $00, $00, $00, $00, $00, $00
DB $70, $80, $30, $41, $30, $47, $30, $4d, $10, $2f, $00, $30, $00, $21, $00, $27
DB $00, $08, $04, $9b, $00, $9f, $00, $30, $00, $00, $00, $40, $00, $80, $00, $07
DB $00, $00, $00, $60, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $03, $03, $03, $01, $03, $01, $03, $01, $01, $03, $01, $01, $01, $01, $01, $01
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $f8, $f0
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $7f, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fc, $fb, $fc, $f8, $f8, $fc, $f8, $fa, $f8, $ff, $f8, $f7, $f8, $f7, $f8, $f2
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $c0, $f0, $e8, $f8, $fc
DB $00, $1b, $00, $38, $00, $18, $00, $10, $00, $11, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $80, $00, $80, $00, $80, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $03, $01, $03, $07, $07, $07, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00
DB $e0, $f0, $c1, $80, $03, $83, $07, $03, $0f, $07, $0f, $1f, $1f, $3f, $7f, $3f
DB $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $f8, $f0, $e0, $e0, $c0, $c0, $c0, $c0, $c0, $e0, $c0, $e0, $c0, $80, $c0
DB $00, $00, $00, $01, $00, $01, $01, $00, $01, $01, $01, $01, $03, $01, $03, $07
DB $fc, $fe, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $fe, $fc
DB $00, $00, $00, $00, $00, $80, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $00, $40, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $0f, $17
DB $00, $00, $01, $00, $03, $07, $0f, $1f, $3f, $7f, $7f, $ff, $ff, $ff, $ff, $ff
DB $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff


SLP_kitty_Text::
DB "    Kitty     "
