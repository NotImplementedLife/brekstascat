; image source: https://www.dummies.com/education/science/physics/string-theory-and-three-dimensions-of-space/

; This file was generated automatically by BRKC_PuzzleMaker at 20-Aug-21 17:33:09.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_klein HighScore", SRAM

SLP_klein_HighScore::
  DS 3

SECTION "Sliding Puzzle klein", ROMX, BANK[5], ALIGN[8]

SLP_klein_Tiles::

DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fc, $fe
DB $ff, $ff, $ff, $ff, $fc, $f8, $e0, $f2, $c0, $af, $31, $4c, $06, $f9, $c7, $38
DB $ff, $fc, $c0, $27, $01, $9a, $0d, $62, $00, $36, $00, $87, $38, $da, $fc, $f7
DB $f8, $07, $00, $fd, $15, $ea, $d5, $2a, $01, $fe, $00, $ed, $00, $e4, $ff, $73
DB $ef, $10, $00, $ef, $c4, $3b, $5d, $a2, $80, $7b, $00, $db, $00, $4f, $ff, $c2
DB $ff, $7f, $47, $b1, $82, $6d, $c0, $3b, $00, $b9, $01, $c2, $57, $aa, $ef, $bf
DB $ff, $ff, $ff, $ff, $3f, $7f, $af, $4f, $7b, $87, $fd, $07, $fa, $37, $ff, $8c
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fd, $fa, $fb, $f8, $f9, $f6, $f6, $f1, $f6, $f9, $f6, $e9, $f9, $e6, $ec, $f3
DB $1f, $e0, $87, $79, $7b, $85, $7f, $83, $8f, $77, $ff, $07, $ff, $07, $7f, $8f
DB $f6, $e9, $ff, $e7, $fb, $c7, $fb, $c4, $fd, $db, $ff, $81, $fd, $82, $ff, $82
DB $ff, $7f, $bf, $40, $3f, $cf, $8f, $70, $df, $af, $cf, $bf, $8f, $78, $cf, $bf
DB $ff, $ff, $ff, $07, $ff, $f7, $f7, $18, $ff, $f7, $ff, $ff, $fa, $25, $ff, $fa
DB $df, $24, $ff, $bf, $ff, $eb, $7f, $ff, $ff, $7f, $ff, $f0, $ff, $ff, $ff, $ff
DB $ff, $dc, $ef, $d7, $ff, $77, $ff, $fc, $fb, $e7, $ff, $7b, $ff, $ff, $fd, $fe
DB $bf, $ff, $bf, $7f, $7f, $df, $ff, $9f, $ff, $bf, $df, $af, $ff, $8f, $ef, $df
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ed, $f2, $e5, $ea, $e9, $f4, $ef, $e0, $ef, $e0, $e3, $fc, $ec, $f3, $ef, $f0
DB $ef, $1d, $ff, $0f, $ff, $0f, $3f, $cf, $ff, $09, $ff, $0f, $ff, $0f, $1f, $ef
DB $ff, $96, $b6, $c9, $ff, $b4, $ff, $87, $ff, $07, $e7, $18, $ff, $00, $ff, $17
DB $ef, $df, $cf, $00, $cf, $7d, $ef, $5f, $ff, $4f, $47, $a8, $ff, $4f, $ef, $5f
DB $ff, $fa, $fb, $04, $ff, $aa, $ff, $fb, $ff, $fb, $fb, $04, $ff, $fa, $ff, $fa
DB $ff, $ff, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $fe
DB $ff, $95, $ff, $fd, $ff, $fc, $ff, $f0, $ff, $1e, $ff, $fe, $fe, $ff, $ff, $f0
DB $ef, $df, $cf, $bf, $ef, $3f, $ff, $ef, $ef, $ef, $ef, $9f, $ef, $6f, $ef, $ef
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f7, $e8, $f9, $e6, $fc, $f3, $fd, $f2, $f5, $f2, $f5, $fa, $fc, $f3, $fb, $fc
DB $ff, $08, $ff, $0f, $7f, $8f, $cf, $3f, $ff, $0c, $ff, $0f, $7f, $8f, $8f, $7f
DB $ff, $03, $c7, $38, $ff, $03, $ff, $00, $bf, $43, $f0, $8f, $ff, $80, $ff, $80
DB $ef, $9f, $87, $78, $e7, $9a, $ff, $87, $df, $a3, $c7, $18, $df, $63, $f7, $8b
DB $ff, $fa, $fa, $05, $ff, $00, $ff, $fa, $ff, $f0, $fa, $05, $ff, $d0, $ff, $f1
DB $ff, $fe, $ff, $8f, $ff, $ff, $ff, $ff, $fe, $f1, $7f, $97, $ff, $7e, $ff, $76
DB $ff, $9e, $ff, $fe, $fe, $f9, $ff, $c6, $ff, $3e, $ff, $fe, $fd, $fa, $ff, $e0
DB $ef, $9f, $ef, $3f, $ef, $df, $ff, $5f, $df, $bf, $5f, $ff, $df, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fa, $fd, $f8, $ff, $fe, $f9, $fc, $ff, $fd, $fc, $ff, $fc, $fe, $ff, $ff, $fe
DB $ff, $01, $ff, $07, $3f, $d7, $c7, $3f, $7f, $80, $7f, $83, $af, $53, $a3, $5f
DB $bf, $c0, $87, $f8, $bf, $c0, $ff, $80, $ff, $80, $c3, $bc, $ff, $c0, $df, $e0
DB $f7, $4f, $eb, $17, $e1, $0e, $ef, $10, $e7, $18, $e7, $18, $00, $fe, $e3, $1c
DB $ff, $e2, $fb, $24, $0b, $f4, $fb, $24, $fb, $a5, $fb, $04, $c3, $3c, $fb, $04
DB $fe, $7d, $b7, $4a, $ff, $36, $ff, $16, $de, $21, $cf, $30, $ef, $19, $ef, $10
DB $ff, $3c, $ff, $fc, $fd, $e1, $ef, $d1, $ff, $00, $f8, $17, $f2, $0d, $d7, $28
DB $bf, $7f, $bf, $7f, $ff, $ff, $7f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $3f, $40, $17, $f9, $8d, $f3, $f9, $86, $cf, $f0, $e7, $d8, $e3, $fc, $fa, $f5
DB $ff, $40, $c1, $fe, $ff, $e0, $ff, $e0, $ef, $10, $f8, $e7, $ff, $70, $7f, $f0
DB $eb, $14, $ed, $12, $84, $79, $ee, $11, $fe, $01, $46, $b9, $f7, $08, $f7, $08
DB $fb, $04, $fa, $05, $03, $fc, $fb, $04, $fb, $04, $10, $ef, $73, $8c, $bb, $44
DB $f4, $0b, $01, $fe, $fb, $04, $fa, $05, $c1, $3a, $1b, $e4, $f6, $09, $f0, $0f
DB $f5, $09, $f3, $0d, $cb, $27, $3f, $c3, $d7, $2f, $cf, $3f, $2f, $df, $3f, $df
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f3, $fc, $f9, $fe, $fc, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f9, $26, $ff, $38, $3f, $d8, $dd, $22, $3d, $4e, $4f, $a6, $be, $85, $c7, $9a
DB $f7, $08, $00, $ff, $ff, $00, $f7, $08, $02, $fd, $fb, $04, $1b, $e4, $ea, $11
DB $b6, $49, $00, $ff, $d5, $2e, $e6, $19, $41, $a6, $f7, $00, $f0, $07, $a1, $5e
DB $05, $fa, $ae, $51, $60, $9f, $0c, $f3, $c8, $35, $c0, $1e, $10, $ed, $a0, $59
DB $1f, $ff, $3f, $3f, $bf, $3f, $3f, $7f, $5f, $3f, $9f, $7f, $af, $4f, $cf, $3f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8
DB $c3, $fd, $eb, $e5, $f3, $f5, $f1, $fe, $fb, $f8, $fc, $fb, $fd, $e0, $fe, $00
DB $7b, $84, $01, $fe, $bb, $d4, $ff, $00, $c0, $bd, $fd, $42, $c1, $3e, $7c, $e3
DB $f9, $06, $c0, $3d, $fd, $02, $ee, $10, $02, $fd, $ee, $11, $c0, $3f, $5d, $a2
DB $03, $b8, $43, $b4, $45, $20, $06, $61, $4b, $84, $1f, $10, $15, $9a, $bc, $0b
DB $17, $e7, $77, $8b, $ab, $50, $b3, $4c, $d1, $26, $4d, $b2, $28, $d7, $3c, $c2
DB $ff, $ff, $ff, $f8, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $c0, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $fc, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $fe, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $2d, $f2, $60, $bd, $3c, $53, $f4, $0b, $bc, $13, $9e, $61, $f8, $06, $da, $2d
DB $dc, $23, $0b, $f4, $da, $24, $c2, $3c, $dc, $23, $d1, $2e, $05, $da, $d5, $28
DB $08, $57, $5f, $20, $e5, $1e, $ef, $00, $f2, $0d, $f7, $02, $ff, $01, $fb, $05
DB $b4, $49, $f9, $06, $4a, $f5, $9b, $64, $af, $70, $fc, $87, $f5, $0a, $d7, $6a
DB $7f, $80, $7f, $80, $3f, $c0, $bf, $00, $3f, $c0, $1f, $e0, $df, $20, $9f, $60
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ce, $31, $dc, $2b, $de, $21, $f4, $0a, $fe, $05, $e6, $1d, $ec, $17, $e7, $1c
DB $c1, $3e, $1d, $e2, $d9, $26, $0d, $f2, $fd, $88, $cb, $34, $ca, $35, $cc, $33
DB $f8, $07, $ff, $00, $fd, $02, $fc, $01, $fe, $01, $fe, $01, $fe, $00, $fe, $00
DB $bf, $48, $ff, $a3, $ff, $28, $f5, $5b, $df, $25, $ff, $ae, $ff, $2a, $7a, $8d
DB $cf, $b0, $8f, $70, $6f, $d0, $ef, $50, $ef, $10, $ef, $90, $a7, $d8, $f7, $28
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $e0, $1f
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $f4, $0b, $f7, $08, $f2, $0c, $fb, $06, $f9, $06, $fd, $03, $fc, $03, $80, $7f
DB $75, $8a, $d7, $28, $6a, $b7, $3d, $c3, $7e, $81, $5f, $b1, $af, $78, $df, $62
DB $7e, $80, $fe, $01, $ee, $90, $78, $80, $c8, $b4, $3d, $e2, $ef, $50, $7d, $d7
DB $ff, $4a, $7f, $db, $7f, $9f, $7f, $c0, $7f, $d5, $ff, $15, $5f, $e1, $ff, $0b
DB $f7, $88, $e8, $57, $c8, $77, $78, $87, $f8, $47, $e0, $5f, $40, $af, $e0, $3f
DB $e0, $1f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $f0, $0f
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $f8, $07, $00, $ff, $00, $ff
DB $ff, $00, $ff, $00, $ff, $00, $fc, $03, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $00, $fe, $01, $c0, $3f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $e0, $1f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $7d, $83, $3f, $c4, $2b, $dd, $0f, $f2, $0a, $f5, $00, $ff, $00, $ff, $00, $ff
DB $ff, $46, $fd, $7e, $bb, $cf, $fe, $29, $fb, $06, $5d, $b6, $1e, $e3, $21, $da
DB $ef, $33, $fb, $ac, $7f, $d6, $d7, $b8, $ff, $8c, $78, $d7, $b8, $47, $00, $7f
DB $c0, $bf, $80, $7f, $80, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff


SLP_klein_Text::
DB " Klein Bottle "
