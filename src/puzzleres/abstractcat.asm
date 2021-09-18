; This file was generated automatically by BRKC_PuzzleMaker at 18-Sep-21 21:28:02.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_abstractcat HighScore", SRAM

SLP_abstractcat_HighScore::
  DS 3

SECTION "Sliding Puzzle abstractcat", ROMX, BANK[3], ALIGN[8]

SLP_abstractcat_Tiles::

DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fd, $f8, $fb, $f4, $f7, $e1, $ef, $c0
DB $ff, $ff, $ff, $bf, $1f, $8f, $0f, $67, $d3, $a7, $e1, $1b, $c8, $36, $3e, $c1
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $9f, $cf, $cf, $c7, $c7, $e3
DB $ff, $ff, $ff, $ff, $fe, $ff, $fc, $fd, $fb, $f8, $f7, $f0, $e7, $ce, $dd, $92
DB $9f, $e0, $33, $cc, $6e, $51, $ec, $93, $df, $00, $c8, $17, $f7, $08, $ef, $10
DB $3f, $c0, $7f, $80, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $3f, $bf, $1f, $df, $cf, $2f, $d7, $23, $db, $21, $dc, $23, $ec, $12, $ef, $14
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $3f, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $fe, $fc, $fc, $fc, $fd, $fc, $fb, $fc, $f9, $f8, $f8, $f0, $f8
DB $c3, $e3, $01, $82, $00, $e1, $c0, $00, $c0, $00, $00, $00, $00, $00, $00, $00
DB $3b, $84, $70, $3f, $80, $fb, $3e, $fc, $07, $5b, $00, $7d, $00, $6f, $00, $ef
DB $6f, $90, $97, $68, $5f, $a0, $1f, $e0, $0f, $b0, $c7, $98, $65, $2a, $12, $65
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ef, $15, $e7, $18, $f7, $0c, $f7, $0a, $fb, $04, $fb, $04, $fb, $04, $fd, $03
DB $1f, $df, $cf, $2f, $37, $c7, $3b, $41, $59, $0c, $2c, $ca, $a4, $1e, $d7, $20
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $7f, $3f, $1f, $bf
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff
DB $f8, $f0, $fc, $ff, $f9, $ff, $f3, $f4, $e7, $c9, $cf, $d7, $9e, $2b, $7d, $06
DB $00, $40, $c0, $c0, $d0, $80, $e0, $08, $f4, $a8, $76, $88, $ea, $10, $f4, $2a
DB $00, $d7, $00, $fd, $00, $1f, $00, $0f, $00, $07, $00, $01, $00, $00, $00, $00
DB $01, $ea, $01, $f8, $00, $7c, $00, $ee, $00, $9e, $00, $df, $00, $3f, $00, $3d
DB $ff, $00, $ff, $00, $bf, $40, $5f, $a0, $3f, $40, $3f, $00, $1f, $c0, $07, $e8
DB $fd, $02, $fd, $02, $fc, $03, $fe, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ca, $d3, $e1, $57, $e1, $2e, $32, $88, $15, $72, $95, $59, $95, $58, $4c, $93
DB $4f, $bf, $67, $87, $23, $db, $e9, $15, $3e, $c0, $7e, $81, $bf, $40, $bf, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $7f, $3f, $3f, $9f, $8f, $5f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fc
DB $fc, $fe, $f9, $f8, $f3, $f5, $e7, $eb, $cf, $df, $9f, $3a, $7f, $2a, $ff, $3e
DB $7f, $8c, $fb, $f5, $bf, $70, $ef, $70, $df, $c9, $b6, $cb, $fe, $2d, $7d, $e0
DB $ec, $31, $fe, $84, $fe, $0c, $fe, $01, $63, $bc, $c7, $38, $e6, $19, $ee, $50
DB $00, $00, $00, $10, $00, $30, $30, $10, $30, $98, $34, $b0, $b7, $36, $b7, $df
DB $00, $1f, $00, $25, $00, $07, $00, $13, $00, $0f, $00, $0b, $00, $10, $80, $e1
DB $07, $f0, $01, $fa, $00, $ef, $00, $3d, $02, $ac, $01, $fa, $80, $79, $00, $fc
DB $ff, $00, $ff, $00, $ff, $00, $3f, $c0, $7a, $85, $39, $46, $87, $38, $c9, $16
DB $5e, $81, $5e, $84, $46, $9a, $c6, $7c, $66, $14, $06, $fc, $cc, $3f, $cc, $2d
DB $bf, $40, $8f, $30, $9f, $e0, $bf, $40, $8f, $70, $3f, $c0, $67, $98, $6c, $93
DB $87, $6f, $f3, $07, $f1, $0d, $f4, $0a, $fc, $03, $fe, $01, $bf, $40, $e1, $1e
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $7f, $3f, $9f, $9f, $4f, $87, $6f
DB $fc, $fd, $fc, $f9, $fe, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fe, $ed, $e7, $dd, $ff, $19, $3f, $73, $9f, $a3, $cf, $f6, $e0, $f6, $f1, $ee
DB $fb, $8c, $f5, $98, $fb, $85, $ff, $a6, $fc, $a2, $c0, $03, $00, $ff, $00, $ff
DB $94, $6b, $99, $45, $73, $a7, $8f, $50, $01, $7e, $00, $f7, $07, $f8, $0b, $f4
DB $ff, $a7, $ff, $c7, $e7, $d8, $66, $99, $a0, $4f, $01, $ae, $07, $88, $07, $07
DB $00, $00, $00, $20, $00, $00, $00, $00, $00, $10, $80, $08, $c0, $84, $c0, $a3
DB $00, $3c, $00, $1f, $00, $0f, $00, $07, $00, $03, $00, $01, $00, $03, $00, $01
DB $6f, $c0, $21, $74, $1c, $23, $0c, $93, $03, $85, $00, $e7, $00, $fc, $30, $c8
DB $cd, $b8, $d9, $18, $19, $91, $33, $f0, $e3, $e0, $06, $c1, $04, $0b, $1f, $0c
DB $0e, $f1, $73, $8c, $7d, $a2, $77, $8f, $87, $68, $10, $ee, $01, $fe, $c0, $3f
DB $e7, $0a, $7f, $8c, $fb, $04, $fe, $49, $fc, $13, $7e, $09, $00, $e7, $01, $fe
DB $c7, $33, $d7, $27, $ef, $07, $5f, $9f, $3f, $bf, $7f, $ff, $ff, $ff, $ff, $ff
DB $fe, $ff, $f8, $f1, $f0, $f1, $fe, $f9, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $00, $ff, $b0, $48, $01, $fe, $0c, $f3, $ff, $f0, $ff, $ff, $ff, $ff, $ff, $ff
DB $00, $bf, $03, $fc, $27, $d8, $7f, $8f, $f3, $0c, $f0, $e7, $f0, $fb, $fc, $f9
DB $04, $fb, $de, $20, $ff, $7e, $ff, $c6, $03, $fc, $00, $ff, $ff, $00, $7f, $80
DB $06, $36, $06, $ff, $06, $ef, $03, $fe, $00, $81, $00, $b7, $ff, $00, $ff, $00
DB $00, $79, $00, $00, $00, $01, $fe, $3d, $ff, $3e, $03, $65, $e0, $1e, $e0, $1f
DB $00, $80, $00, $00, $00, $ff, $00, $ff, $00, $ff, $ef, $d0, $7f, $ff, $0f, $97
DB $00, $80, $00, $00, $00, $c3, $00, $ff, $00, $ff, $07, $f8, $ff, $ff, $ff, $ff
DB $1f, $33, $7d, $02, $03, $fc, $00, $fb, $00, $8c, $fc, $01, $fd, $fe, $fd, $fc
DB $f0, $cf, $ff, $f0, $7f, $a0, $9f, $60, $00, $ff, $04, $f9, $f1, $3f, $f3, $0f
DB $00, $ff, $00, $ff, $c0, $3f, $f0, $0f, $7f, $80, $ff, $ff, $ff, $ff, $ff, $ff
DB $1f, $ef, $03, $f7, $41, $b3, $03, $f7, $ff, $3f, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fe, $fc, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $2f, $d0, $1f, $60, $97, $a8, $c3, $dc, $e7, $e8, $f3, $f8, $f8, $fd, $fe, $fc
DB $ff, $00, $fe, $01, $ff, $00, $f0, $0f, $d8, $27, $43, $bc, $8b, $7c, $7f, $82
DB $cb, $34, $38, $c7, $8b, $54, $ce, $31, $3f, $c0, $df, $20, $fd, $22, $ff, $00
DB $21, $da, $a4, $5b, $df, $20, $fe, $10, $f1, $0e, $e4, $9b, $7b, $84, $7f, $87
DB $ff, $ff, $07, $ba, $c8, $17, $3f, $c0, $fd, $62, $ff, $03, $ff, $e1, $ff, $90
DB $fd, $fc, $fd, $78, $01, $02, $6f, $80, $7e, $bc, $f9, $d5, $f3, $0b, $e7, $17
DB $c7, $2f, $cf, $1f, $3f, $9f, $7f, $3f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $7f, $02, $9e, $29, $cb, $d5, $e3, $ec, $f3, $f4, $f8, $fb, $fc, $fe, $fe, $ff
DB $f3, $0c, $7f, $83, $ff, $f7, $ff, $00, $ff, $5e, $ff, $7b, $ff, $1d, $3f, $c7
DB $ff, $60, $ff, $6f, $ff, $47, $ff, $0f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fc
DB $bf, $5e, $ff, $de, $ff, $b8, $fe, $70, $f9, $cc, $e3, $59, $c7, $f7, $cf, $af
DB $cf, $3f, $9f, $3f, $3f, $7f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $17, $ab, $cf, $94, $ef, $c6, $f3, $e7, $fb, $f8, $fc, $fd, $fe, $fc, $ff, $ff
DB $ff, $f6, $f7, $0a, $fe, $f1, $fc, $f9, $f9, $23, $e7, $93, $4f, $e7, $1f, $0f
DB $9f, $5f, $3f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff


SLP_abstractcat_Text::
DB " Abstract Cat "
