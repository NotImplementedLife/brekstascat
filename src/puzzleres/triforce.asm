; source: https://zelda.fandom.com/wiki/Triforce
; This file was generated automatically by BRKC_PuzzleMaker at 20-Aug-21 18:58:39.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_triforce HighScore", SRAM

SLP_triforce_HighScore::
  DS 3

SECTION "Sliding Puzzle triforce", ROMX, BANK[5], ALIGN[8]

SLP_triforce_Tiles::

DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe
DB $ff, $e8, $ff, $f0, $ff, $d0, $ff, $e0, $ff, $a0, $ff, $40, $ff, $00, $ff, $80
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $7f, $ff, $5f, $ff, $2f, $ff, $1f, $ff, $17, $ff, $0f, $ff, $0b, $ff, $05
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $fd, $ff, $fe, $ff, $fa, $ff, $f4, $ff, $f0, $ff, $e8, $ff, $f0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $01, $ff, $03, $ff, $07, $ff, $07, $ff, $0e, $ff, $0e, $ff, $1c, $fd, $1a
DB $3f, $c0, $3f, $80, $1f, $80, $1f, $80, $8f, $00, $87, $e8, $e7, $90, $c3, $24
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $01, $ff, $02, $ff, $01, $ff, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $bf, $ff, $3f, $ff, $5f, $ff, $3f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $ff, $ff, $fd
DB $ff, $d0, $ff, $e0, $ff, $a0, $ff, $40, $ff, $00, $ff, $80, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $01, $ff, $03
DB $fb, $3d, $fb, $74, $f5, $72, $eb, $f5, $eb, $f5, $d7, $eb, $d7, $ab, $af, $d7
DB $e3, $10, $f1, $00, $f0, $8d, $f8, $80, $fc, $c2, $fc, $c3, $fc, $e3, $f6, $e8
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80, $3f, $40, $3f, $40, $1f, $20
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $2f, $ff, $17, $ff, $17, $ff, $0b, $ff, $07, $ff, $05, $ff, $03, $ff, $02
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $fe, $ff, $fa, $ff, $f4, $ff, $f0, $ff, $e8, $ff, $f0, $ff, $d0, $ff, $e0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $07, $ff, $07, $ff, $0e, $fe, $0f, $fd, $1e, $fd, $1a, $fa, $3d, $fc, $73
DB $8d, $7a, $5f, $ab, $b7, $5f, $37, $df, $77, $af, $77, $c3, $da, $79, $d8, $af
DB $7b, $94, $ff, $38, $ff, $f8, $fe, $bd, $fe, $fd, $fe, $ff, $f7, $fe, $ff, $cf
DB $1f, $40, $0f, $90, $af, $40, $87, $78, $d3, $24, $c3, $24, $e1, $12, $b1, $40
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $7f, $ff, $ff, $ff, $bf, $ff, $7f, $ff, $5f, $ff, $2f, $ff, $1f, $ff, $17
DB $ff, $a0, $ff, $40, $ff, $00, $ff, $80, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $01, $ff, $03, $ff, $07, $ff, $07
DB $f5, $7a, $eb, $f5, $e3, $fd, $d3, $ee, $c6, $b9, $8f, $f4, $cf, $3d, $1f, $ef
DB $d8, $2f, $d8, $37, $99, $77, $1f, $f9, $1f, $ff, $ff, $8f, $ef, $be, $f0, $0f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $b7, $bf, $ef, $1f, $df, $3f, $df
DB $d0, $a9, $d8, $a0, $c8, $f4, $ec, $d0, $e6, $f8, $fe, $e1, $f3, $fc, $fb, $fc
DB $ff, $00, $ff, $00, $7f, $80, $3f, $40, $3f, $40, $1f, $20, $1f, $00, $0f, $90
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $0f, $ff, $0b, $ff, $05, $ff, $01, $ff, $02, $ff, $01, $ff, $01, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $0e, $fe, $0f, $fd, $1e, $fe, $1d, $f9, $3e, $fc, $73, $fa, $74, $f8, $e3
DB $9f, $70, $3f, $d1, $3f, $e2, $4e, $bb, $4c, $f7, $ff, $ff, $10, $ef, $79, $86
DB $d0, $6f, $d0, $2f, $d1, $0e, $53, $bd, $37, $eb, $ff, $ff, $00, $fe, $23, $dc
DB $7f, $bf, $ff, $7f, $ff, $ff, $ff, $ff, $e1, $de, $ff, $ff, $00, $f3, $24, $db
DB $fc, $fb, $fd, $fe, $ff, $fc, $fe, $ff, $97, $7a, $ff, $ff, $02, $dd, $25, $da
DB $8f, $00, $c7, $88, $c3, $44, $e3, $04, $e1, $3a, $f1, $10, $38, $d1, $b8, $48
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $01, $ff, $03, $ff, $03, $ff, $07, $ff, $07, $ff, $0f, $ff, $0f
DB $ff, $ef, $e0, $c0, $e0, $f0, $f0, $d0, $d8, $f0, $b8, $ec, $fc, $2c, $06, $fe
DB $ff, $ff, $00, $00, $00, $00, $00, $00, $f0, $0f, $7f, $80, $7f, $00, $3f, $40
DB $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $00, $00, $00, $00, $00, $00, $1f, $e0, $fe, $01, $fe, $00, $fc, $02
DB $fc, $f8, $04, $02, $0e, $06, $0e, $0b, $1f, $89, $3f, $37, $72, $7d, $ed, $72
DB $7f, $80, $3f, $40, $3f, $00, $1f, $20, $5f, $80, $ef, $50, $e7, $88, $c7, $78
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01
DB $fe, $1f, $fe, $3f, $ff, $3c, $fe, $7b, $ff, $7e, $fe, $ff, $ff, $ec, $fd, $fb
DB $26, $fe, $ff, $02, $ff, $05, $ff, $06, $f7, $2f, $9b, $e7, $cf, $01, $0f, $f9
DB $1f, $20, $1f, $20, $0f, $10, $8f, $80, $87, $e8, $e3, $44, $f3, $e4, $f9, $e2
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $f9, $05, $fb, $06, $f7, $09, $f7, $0f, $ef, $1b, $ff, $16, $ff, $17, $ff, $2d
DB $e1, $5e, $f9, $c4, $f0, $b9, $e0, $fc, $e0, $4e, $db, $f5, $fc, $91, $b2, $ac
DB $f3, $e4, $e3, $20, $f1, $4e, $f9, $74, $7c, $0b, $7e, $8a, $be, $d7, $9f, $f6
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $03, $ff, $03, $ff, $07, $ff, $07, $ff, $0e, $ff, $0e, $ff, $1e, $ff, $3d
DB $fa, $dd, $fa, $a6, $be, $74, $fc, $67, $ee, $65, $cc, $d3, $cd, $90, $85, $bb
DB $0f, $d0, $3e, $1f, $1f, $2e, $0f, $97, $0f, $e6, $03, $ee, $03, $e8, $05, $c8
DB $f1, $b8, $f4, $59, $7c, $ee, $7e, $b6, $bf, $76, $ff, $9b, $df, $3b, $ed, $df
DB $ff, $00, $ff, $00, $7f, $80, $7f, $80, $3f, $40, $3f, $40, $1f, $20, $9f, $c0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fd, $03
DB $df, $3b, $ff, $3b, $fe, $36, $7e, $f4, $ec, $7c, $fc, $d9, $d8, $fb, $b1, $fe
DB $20, $b6, $30, $5c, $5b, $b5, $80, $4e, $00, $00, $01, $02, $07, $00, $07, $8c
DB $9f, $cb, $8f, $bd, $8f, $65, $67, $96, $17, $e3, $db, $23, $3d, $cb, $35, $cb
DB $ff, $80, $df, $60, $5f, $40, $cf, $10, $8f, $60, $77, $c8, $f3, $bc, $f3, $b0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fc, $03
DB $fb, $3c, $fb, $37, $7e, $b7, $ee, $76, $fd, $ee, $fd, $c2, $d8, $2b, $b0, $99
DB $3f, $88, $3b, $5e, $7a, $8d, $c2, $3d, $9a, $6c, $70, $88, $28, $d4, $4c, $30
DB $06, $01, $07, $00, $07, $06, $07, $02, $07, $06, $06, $01, $07, $05, $05, $03
DB $2f, $d9, $96, $27, $d7, $3b, $03, $ab, $fb, $79, $cd, $cd, $cc, $ae, $04, $80
DB $cf, $90, $e7, $c8, $e7, $68, $73, $e4, $f3, $ac, $99, $6a, $d9, $12, $c0, $39
DB $ff, $01, $ff, $03, $ff, $06, $fe, $17, $fd, $16, $fc, $39, $fb, $28, $f2, $6d
DB $f2, $35, $61, $ee, $6c, $83, $c5, $da, $c8, $96, $80, $26, $00, $20, $00, $00
DB $c0, $04, $c0, $00, $00, $80, $00, $00, $00, $00, $01, $00, $01, $02, $80, $83
DB $fe, $09, $7e, $87, $3f, $46, $1f, $01, $03, $00, $41, $82, $00, $e1, $00, $d8
DB $d1, $e2, $f1, $58, $68, $79, $78, $b4, $bc, $36, $de, $b8, $de, $da, $ed, $8e
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $3f, $40, $3f, $40, $5f, $a0
DB $f9, $07, $f9, $07, $ff, $01, $fe, $10, $fc, $13, $fd, $30, $f8, $30, $e0, $40
DB $b0, $75, $69, $f6, $e1, $2e, $c0, $60, $3c, $f3, $bc, $4b, $00, $00, $00, $00
DB $f0, $4c, $f8, $10, $a8, $50, $00, $00, $f0, $2b, $01, $a8, $00, $00, $00, $00
DB $01, $06, $00, $00, $00, $00, $00, $00, $c0, $30, $00, $90, $00, $00, $00, $00
DB $05, $00, $35, $6a, $32, $49, $00, $00, $06, $88, $0c, $92, $00, $00, $00, $00
DB $6c, $68, $66, $3e, $23, $86, $03, $03, $41, $a2, $81, $59, $00, $00, $00, $00
DB $d0, $64, $a4, $e8, $e8, $c4, $c4, $88, $82, $c5, $80, $83, $00, $00, $00, $00
DB $00, $00, $00, $c0, $00, $c0, $00, $18, $30, $cd, $00, $13, $00, $00, $00, $00
DB $00, $81, $00, $00, $00, $00, $00, $01, $1c, $03, $00, $1e, $00, $00, $00, $00
DB $08, $f0, $7c, $58, $70, $0c, $00, $80, $00, $09, $00, $00, $00, $00, $00, $00
DB $6f, $90, $72, $15, $13, $0e, $02, $b9, $fa, $0c, $00, $7b, $01, $10, $00, $00
DB $1f, $e0, $ef, $b0, $7f, $c0, $67, $e0, $a3, $64, $a3, $10, $11, $82, $01, $00
DB $80, $00, $80, $7f, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $01, $fe, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00


SLP_triforce_Text::
DB "   Triforce   "
