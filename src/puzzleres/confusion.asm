; This file was generated automatically by BRKC_PuzzleMaker at 26-Aug-21 19:30:17.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_confusion HighScore", SRAM

SLP_confusion_HighScore::
  DS 3

SECTION "Sliding Puzzle confusion", ROMX, BANK[6], ALIGN[8]

SLP_confusion_Tiles::

DB $82, $04, $ae, $15, $4c, $8e, $78, $98, $31, $70, $73, $e1, $c3, $e7, $c7, $87
DB $03, $01, $3f, $03, $7f, $0f, $5e, $2c, $fc, $1c, $f8, $70, $f3, $e9, $e3, $93
DB $c1, $80, $c3, $c7, $8f, $1f, $3f, $1f, $7f, $ff, $fe, $fc, $f8, $f0, $e3, $e1
DB $fe, $f0, $ff, $f4, $f7, $eb, $df, $e7, $3f, $9f, $3f, $3f, $ff, $7f, $ff, $fd
DB $06, $01, $ff, $e7, $ff, $ff, $ff, $7f, $ff, $ff, $ff, $fe, $e3, $c0, $9f, $1f
DB $ff, $7f, $ff, $ff, $ff, $f3, $ff, $ff, $ff, $ff, $f1, $00, $ff, $7f, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f1, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $7f, $ff, $fe, $ff, $ff, $ff, $c1, $ff, $f8, $ff, $1f, $ff, $c7, $ff, $f8
DB $fe, $fd, $ff, $77, $ff, $e6, $ff, $ff, $ff, $7f, $ff, $0f, $ff, $e3, $ff, $f3
DB $e1, $03, $fd, $f0, $fe, $3f, $8f, $47, $e3, $c1, $f8, $fc, $fe, $fc, $ff, $ff
DB $86, $0f, $87, $c7, $c3, $e1, $f0, $20, $f8, $f8, $f4, $ea, $3e, $39, $9d, $1a
DB $00, $00, $81, $03, $c0, $d0, $e0, $c0, $70, $60, $70, $38, $18, $18, $0c, $1e
DB $0f, $87, $1f, $07, $3e, $1d, $3c, $7f, $78, $7e, $f0, $7c, $f1, $e1, $e3, $e3
DB $af, $57, $cf, $0f, $9e, $1e, $3c, $7c, $78, $78, $f1, $f1, $e3, $e3, $c7, $c7
DB $c7, $c7, $0f, $1f, $3e, $1f, $79, $3c, $ff, $f3, $ef, $f7, $ff, $8f, $ff, $8f
DB $f9, $cc, $bf, $df, $ff, $1f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8, $ff, $fb
DB $ff, $ff, $ff, $fc, $ff, $c7, $ff, $ff, $ff, $f9, $ff, $87, $ff, $3f, $ff, $fd
DB $ff, $f8, $ff, $07, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $7f, $ff, $df, $ff, $c1, $ff, $fc, $ff, $ff, $ff, $f3, $ff, $ff, $ff, $ff
DB $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $e7, $fb, $f3, $ff, $fe, $ff, $ff
DB $ff, $3f, $ff, $8f, $ff, $e7, $ff, $f3, $ff, $f8, $ff, $fe, $ff, $3f, $ff, $bf
DB $ff, $b9, $ff, $fe, $ff, $ff, $ff, $f3, $ff, $f9, $ff, $fc, $ff, $7e, $ff, $f7
DB $cf, $e7, $e7, $f3, $fb, $b1, $fd, $9c, $fe, $f6, $fb, $f7, $ff, $3f, $ff, $1f
DB $8e, $07, $c3, $a7, $e3, $c3, $e1, $c1, $70, $f8, $78, $70, $b8, $38, $1c, $fc
DB $c7, $c7, $0f, $87, $0e, $1f, $1e, $1c, $3c, $3e, $78, $3e, $78, $71, $fd, $70
DB $8f, $8f, $9f, $1f, $1f, $3e, $7e, $3c, $7d, $78, $79, $71, $f3, $f3, $e7, $e7
DB $df, $bf, $bf, $3f, $7f, $3f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $e3, $ff, $cf, $ff, $9f, $ff, $ff, $ff, $3f, $ff, $7f, $df, $dd, $df, $db
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f9, $ff, $f7, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $f1, $ff, $ff, $ff, $ff, $ff, $f8, $ff, $c7, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $f9, $fe, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $e3
DB $ff, $f9, $ff, $fc, $7f, $ff, $ff, $9f, $ff, $cf, $ff, $e7, $fe, $f6, $f9, $f8
DB $ff, $ff, $ff, $7f, $ff, $3f, $ff, $9f, $ff, $fb, $7f, $7b, $3f, $2d, $bf, $36
DB $ff, $9f, $ff, $c7, $ff, $f7, $ff, $f1, $ff, $fd, $ff, $fe, $f7, $fe, $fb, $ff
DB $de, $ac, $fe, $c6, $e7, $f7, $e7, $e7, $f3, $e3, $f9, $f1, $f9, $f8, $fc, $fc
DB $f5, $e9, $fb, $e3, $db, $e3, $d7, $a7, $77, $87, $0f, $67, $4e, $2e, $1e, $6e
DB $e7, $c7, $cf, $cf, $9f, $8f, $9f, $bf, $3f, $3f, $3f, $3f, $7f, $3e, $ff, $7f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $df, $bf, $ff, $fe, $fe, $fe, $fe, $fc, $fc
DB $af, $8f, $af, $8f, $b7, $87, $57, $07, $5b, $03, $1b, $03, $bb, $03, $69, $01
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8, $f8
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00
DB $ff, $fd, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00
DB $fb, $f8, $f7, $70, $ec, $a0, $ec, $e0, $db, $c0, $93, $80, $b7, $80, $a7, $80
DB $bf, $3b, $bf, $3b, $bf, $3f, $df, $0f, $5f, $0f, $67, $07, $6f, $0f, $eb, $0b
DB $ff, $79, $fc, $ff, $fe, $ef, $ff, $ef, $ff, $ef, $ff, $f7, $ff, $f7, $ff, $fb
DB $fc, $fe, $fe, $7e, $7e, $7e, $7f, $ff, $3f, $3f, $9f, $ff, $df, $bf, $df, $cf
DB $1e, $7c, $7d, $1e, $3d, $3a, $3a, $7c, $7e, $b8, $7e, $7c, $7d, $76, $7d, $75
DB $ff, $7d, $7f, $f9, $fb, $fb, $f7, $ff, $f7, $f7, $e7, $f7, $ef, $e7, $ef, $ef
DB $fd, $fc, $f8, $f8, $f9, $f8, $f3, $f0, $e6, $e0, $ec, $e0, $c0, $c1, $c0, $c3
DB $ed, $01, $ec, $00, $e8, $05, $80, $0d, $00, $3d, $00, $fd, $00, $fd, $00, $fd
DB $80, $80, $00, $0f, $00, $ff, $00, $ff, $00, $ff, $03, $fc, $3f, $c0, $7f, $80
DB $00, $1f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00
DB $00, $f0, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $f0, $0f, $fe, $01, $ff, $00
DB $27, $40, $01, $60, $00, $7c, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $e0, $1f
DB $f7, $07, $f7, $07, $7b, $03, $1b, $03, $03, $e3, $01, $f9, $00, $fc, $00, $fe
DB $ff, $fb, $ff, $fb, $ff, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $bf, $ff, $ff
DB $ef, $d7, $e7, $ff, $f7, $ef, $f3, $f7, $fb, $ff, $f9, $f9, $f9, $f9, $79, $ff
DB $7d, $79, $79, $7d, $79, $f9, $fb, $79, $fb, $7b, $fb, $7b, $fb, $7b, $fb, $7b
DB $cf, $ef, $cf, $cf, $df, $cf, $df, $df, $df, $9f, $df, $df, $df, $9f, $9f, $df
DB $c0, $c7, $80, $8f, $80, $9f, $80, $9f, $80, $bf, $81, $be, $83, $bc, $87, $b8
DB $01, $fc, $07, $f8, $0f, $f0, $3f, $c0, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $fe, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $fe, $80, $7f, $e0, $1f, $f0, $0f, $f8, $07, $fe, $01, $fe, $01, $ff, $00
DB $7f, $7f, $7f, $7f, $3f, $3f, $1f, $1f, $1f, $df, $1f, $df, $1f, $df, $1f, $9f
DB $7d, $fd, $7c, $fd, $7c, $76, $7c, $36, $7e, $3c, $3e, $7c, $3e, $3c, $3e, $3c
DB $fb, $ff, $ff, $f3, $f3, $f3, $f7, $f3, $ff, $f3, $fb, $73, $73, $71, $73, $73
DB $bf, $9f, $bf, $df, $df, $9f, $9f, $df, $9f, $cf, $df, $cf, $df, $ef, $ef, $df
DB $87, $b8, $8f, $b0, $9f, $a0, $bf, $80, $bf, $00, $1f, $00, $0f, $80, $4f, $40
DB $ff, $00, $ff, $00, $fc, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $3f, $00, $c7, $00, $81, $00, $bc, $3c, $b8, $38, $b8, $38
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $3f, $00, $9f, $80
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $fe, $00, $f0, $00, $c7, $07, $a3, $23, $63, $63
DB $ff, $00, $ff, $00, $e1, $00, $1f, $00, $df, $c0, $cf, $c0, $cf, $c0, $c7, $c0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $00, $fc, $00
DB $1f, $9f, $9f, $1f, $9f, $1f, $9f, $1f, $3f, $3f, $3f, $3f, $7f, $7f, $7f, $7f
DB $3e, $7e, $3e, $7e, $3c, $3e, $bc, $3c, $bc, $3d, $bc, $39, $bc, $79, $b9, $78
DB $73, $73, $73, $7b, $3b, $3b, $39, $3b, $39, $39, $3d, $39, $3d, $18, $1c, $1c
DB $e7, $ef, $e7, $f7, $f7, $e7, $f7, $f7, $fb, $f3, $fb, $fb, $fb, $fb, $fd, $f9
DB $67, $60, $37, $30, $b3, $30, $b9, $b8, $98, $98, $dc, $9c, $dc, $dc, $ff, $cf
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $3f, $00
DB $38, $38, $98, $18, $cd, $0d, $f1, $01, $fc, $00, $ff, $00, $ff, $00, $ff, $00
DB $ef, $e0, $e7, $e0, $eb, $e0, $ec, $e0, $1c, $00, $3e, $00, $ff, $00, $ff, $00
DB $fe, $00, $fd, $00, $fb, $00, $03, $00, $07, $00, $0f, $00, $1f, $00, $9f, $00
DB $63, $63, $77, $77, $70, $70, $83, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $9f, $80, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $f9, $01, $f9, $01, $f3, $03, $e7, $07, $cf, $0f, $8f, $0f, $9f, $1f, $3f, $3f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7e, $ff, $7e, $ff, $7e, $ff, $ec, $ff, $dd
DB $b9, $79, $f9, $79, $fb, $71, $f3, $73, $f3, $f3, $f7, $f3, $e7, $e7, $e7, $e7
DB $de, $dc, $de, $4e, $4e, $ee, $6f, $cf, $e7, $3f, $f7, $ef, $ff, $c3, $ef, $f7
DB $fd, $fd, $7d, $fe, $7f, $7c, $3e, $1d, $3e, $1f, $9f, $ae, $df, $8f, $e7, $d7
DB $ff, $ef, $ff, $f7, $ff, $7b, $ff, $7b, $ff, $7d, $7f, $7d, $3f, $7f, $bf, $9f
DB $9f, $80, $cf, $c0, $f3, $f0, $fd, $fc, $fe, $fe, $ff, $fd, $ff, $fe, $ff, $ff
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $5f, $00, $0f, $00, $e3, $e0, $f8, $f8
DB $ff, $00, $ff, $00, $3e, $00, $9c, $00, $c0, $00, $f3, $00, $ff, $00, $7f, $00
DB $9f, $00, $0f, $00, $67, $00, $63, $00, $f0, $00, $fc, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $cf, $00, $9f, $00, $3f, $00, $ff, $00, $fc, $00, $f1, $01
DB $fe, $00, $fc, $00, $f9, $01, $f3, $03, $a7, $07, $1f, $1f, $ff, $fe, $ff, $fd
DB $7f, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $ff, $ff, $ff
DB $ff, $dd, $ff, $d9, $ff, $bb, $ff, $fb, $ff, $e7, $ff, $ef, $ff, $df, $ff, $df
DB $ef, $e7, $cf, $cf, $df, $cf, $df, $cf, $bf, $9f, $be, $bf, $be, $5d, $7d, $bd
DB $f7, $e3, $f3, $73, $7b, $f1, $79, $78, $3c, $7d, $1c, $7e, $5e, $9e, $4f, $ef
DB $f7, $e3, $fb, $f3, $fd, $f9, $fc, $fc, $fe, $fe, $7f, $ff, $7f, $3f, $3d, $3f
DB $df, $9f, $cf, $cf, $e7, $e7, $f3, $f3, $f9, $71, $7c, $3c, $bf, $be, $df, $ef
DB $ff, $ff, $ff, $ff, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $bf
DB $fe, $fe, $ff, $f3, $ff, $fc, $ff, $7f, $ff, $ff, $ff, $f3, $ff, $fc, $ff, $ff
DB $0f, $00, $81, $80, $fc, $fc, $ff, $f9, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $3f
DB $ff, $00, $ff, $00, $78, $00, $07, $07, $ff, $f9, $ff, $ff, $ff, $ff, $ff, $ff
DB $ef, $0f, $0f, $0f, $ff, $ff, $ff, $fe, $ff, $f9, $ff, $ff, $ff, $fe, $ff, $ff
DB $ff, $fb, $ff, $e7, $ff, $9e, $ff, $7d, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $ff
DB $ff, $ff, $ff, $7f, $ff, $fd, $ff, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $bf, $ff, $be, $fe, $ff, $fe, $fd, $fd, $fb, $fb, $f9, $fb, $f3, $f7, $ff
DB $fd, $38, $7b, $f8, $77, $fa, $f7, $f6, $ef, $e4, $df, $ef, $df, $9b, $f7, $b7
DB $6f, $ef, $f7, $2f, $f7, $c3, $ff, $d1, $f9, $f7, $70, $fc, $7e, $7c, $3e, $1e
DB $9e, $1f, $8f, $9f, $e7, $c7, $e7, $f3, $fb, $f1, $f8, $fd, $7c, $7e, $7f, $3e
DB $ef, $77, $ff, $73, $ff, $b3, $ff, $f3, $ff, $f9, $fe, $fc, $ff, $7f, $7f, $1f
DB $ff, $e7, $ff, $f3, $ff, $fc, $ff, $ff, $ff, $ff, $ff, $7f, $3f, $9f, $8f, $9f
DB $ff, $ff, $ff, $ff, $ff, $1f, $ff, $c3, $ff, $f8, $ff, $ff, $ff, $ef, $ff, $fb
DB $ff, $ff, $ff, $e3, $ff, $ff, $ff, $ff, $ff, $f7, $ff, $f8, $ff, $fe, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $41, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $fc, $ff, $f3, $ff, $cf, $ff, $3f, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f7, $ff, $ef
DB $ff, $ee, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fc, $f8, $f1, $f0, $e3, $e1
DB $ef, $67, $cf, $cf, $9e, $de, $3e, $9c, $7c, $3c, $f8, $78, $f0, $e1, $e1, $e3
DB $1f, $2f, $0f, $67, $07, $43, $13, $89, $c1, $a0, $e6, $d9, $ee, $d4, $e3, $f4
DB $1f, $1f, $8f, $8f, $c7, $c7, $f3, $e3, $70, $f9, $fc, $d8, $7e, $9e, $17, $2f
DB $bf, $77, $ff, $8f, $ef, $d7, $f7, $e0, $fd, $fa, $7f, $7c, $3f, $1f, $8f, $0f
DB $e3, $e1, $f8, $ff, $ff, $fe, $ff, $ff, $ff, $3f, $3f, $cf, $e3, $07, $f8, $e0
DB $ff, $ff, $ff, $7f, $ff, $1f, $df, $af, $fe, $f9, $ff, $e1, $ff, $fc, $ff, $7f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ef, $df, $1f, $a0, $ff, $ff
DB $ff, $ff, $ff, $fd, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fc
DB $ff, $ff, $ff, $fe, $ff, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $fc, $fc, $f3, $e9, $ff, $ff, $ff, $ff, $ff, $ff, $fc, $fe
DB $ff, $9f, $7f, $3f, $fe, $fe, $fc, $f8, $f0, $f0, $c1, $c1, $87, $03, $0f, $0f
DB $c7, $c7, $0f, $07, $3f, $1e, $7e, $3c, $f8, $f8, $f0, $e0, $c0, $e1, $83, $83
DB $c3, $83, $87, $c7, $0e, $07, $1e, $3c, $3c, $38, $78, $78, $f0, $e0, $e0, $c0


SLP_confusion_Text::
DB "  Confusion   "
