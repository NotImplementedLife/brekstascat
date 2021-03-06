; This file was generated automatically by BRKC_PuzzleMaker at 19-Aug-21 09:04:41.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_MonaLisa HighScore", SRAM

SLP_MonaLisa_HighScore::
  DS 3

SECTION "Sliding Puzzle MonaLisa", ROMX, BANK[5], ALIGN[8]

SLP_MonaLisa_Tiles::

DB $ff, $00, $ff, $00, $ff, $00, $ff, $0c, $ff, $3c, $ff, $38, $ff, $18, $ff, $01
DB $ff, $10, $ff, $00, $ff, $00, $ff, $80, $ff, $00, $ff, $30, $ff, $79, $ff, $f9
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $0f, $ff, $3f, $ff, $3e
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $06
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $0c, $fe, $18, $fc, $f0
DB $ff, $00, $ff, $00, $ff, $00, $fe, $00, $c0, $80, $00, $00, $00, $10, $00, $30
DB $ff, $00, $ff, $18, $ff, $00, $7f, $00, $03, $00, $00, $00, $00, $00, $00, $00
DB $ff, $01, $ff, $01, $ff, $00, $ff, $00, $ff, $00, $7f, $09, $1f, $01, $0f, $03
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $07
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $ff, $00, $ff, $00
DB $ff, $07, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $1e, $ff, $1f, $ff, $3f, $ff, $bf, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f8, $e0, $f0, $e0, $c0, $e3, $c3, $e4, $83, $cc, $8f, $90, $0f, $90, $0f, $10
DB $00, $20, $00, $60, $00, $ff, $f8, $07, $fe, $01, $ff, $00, $ff, $00, $ff, $00
DB $00, $00, $00, $00, $00, $00, $00, $80, $00, $c0, $00, $e0, $00, $f0, $80, $70
DB $07, $02, $01, $03, $01, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
DB $ff, $f0, $ff, $f0, $ff, $f9, $ff, $ff, $7f, $ff, $3f, $ff, $3f, $7f, $3f, $7f
DB $ff, $1f, $ff, $1f, $ff, $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $70, $ff, $fc, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $ff, $c0, $ff, $c0
DB $ff, $ff, $ff, $ff, $ff, $f3, $ff, $01, $ff, $00, $ff, $00, $3f, $c0, $3f, $c0
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f9, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $0f, $ff, $07
DB $ff, $fe, $ff, $fc, $fe, $fc, $fe, $f8, $fc, $f8, $fc, $f8, $fc, $f0, $fc, $f0
DB $0f, $30, $0f, $10, $0f, $30, $0f, $30, $1f, $20, $1f, $20, $11, $2e, $00, $3f
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $f8, $07, $e0, $1f, $e0, $13
DB $80, $78, $00, $f8, $00, $fe, $00, $fe, $c0, $3e, $00, $fe, $00, $fc, $00, $c0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $3f, $3f, $3f, $01, $1f, $20, $1f, $20, $1f, $20, $17, $28, $07, $18, $00, $1f
DB $ff, $ff, $ff, $1f, $ff, $33, $ff, $30, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $3f, $ff, $3f
DB $ff, $f0, $ff, $f8, $ff, $f8, $ff, $f8, $ff, $f0, $ff, $f0, $ff, $f0, $ff, $f0
DB $ff, $00, $ff, $00, $ff, $00, $7f, $80, $7f, $80, $5f, $a0, $02, $fd, $00, $ff
DB $ff, $00, $ff, $00, $f9, $06, $f9, $06, $f1, $0e, $01, $fe, $20, $df, $70, $8f
DB $ff, $07, $ff, $07, $ff, $06, $ef, $10, $26, $d9, $00, $ff, $00, $ff, $00, $ff
DB $f8, $e0, $f8, $70, $f8, $00, $b8, $40, $98, $60, $88, $70, $00, $f8, $00, $fc
DB $00, $08, $00, $28, $00, $3f, $18, $27, $3f, $00, $1f, $20, $1f, $20, $1f, $20
DB $60, $83, $62, $85, $62, $9d, $e2, $1d, $c7, $38, $c7, $38, $e7, $18, $c7, $38
DB $00, $02, $00, $0f, $04, $fb, $1c, $e3, $f8, $07, $f0, $0e, $f0, $0e, $e0, $1e
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $0f, $00, $0f, $03, $0c, $03, $0c
DB $f9, $06, $79, $86, $49, $b6, $61, $9e, $60, $9f, $60, $9f, $fa, $05, $ff, $00
DB $ff, $3f, $ff, $3f, $ff, $3f, $7f, $9e, $7f, $9e, $7f, $86, $3f, $c0, $ff, $00
DB $ff, $e0, $ff, $c0, $ff, $80, $ff, $80, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $3c, $c3, $00, $ff, $03, $fc, $01, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $fc, $00, $fc, $00, $fe, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $1e, $21, $0e, $31, $07, $18, $03, $1c, $01, $1e, $00, $0f, $03, $0c, $01, $0e
DB $c3, $3c, $c3, $34, $03, $84, $80, $4f, $80, $7f, $00, $e1, $c0, $3f, $80, $7f
DB $c0, $3c, $80, $78, $00, $f8, $00, $f8, $00, $f8, $00, $f8, $00, $f8, $00, $f0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $0f, $00, $0f, $00, $0f, $00, $0f, $00, $07, $00, $07, $00, $07, $00, $07
DB $33, $cc, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $00, $3f, $c0, $00, $ff, $00, $ff, $00, $ff, $03, $fc, $00, $ff, $00, $ff
DB $e7, $18, $40, $bf, $00, $ff, $00, $ff, $00, $ff, $80, $7f, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $7f, $80, $3f, $c0
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $70, $8f, $f0, $0f, $f0, $0f, $f0, $0f
DB $01, $02, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $80, $7f, $f0, $0f, $f0, $0f, $00, $fc, $00, $00, $00, $00, $00, $00, $00, $18
DB $00, $e0, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $07, $00, $07, $00, $07, $00, $07, $00, $03, $00, $03, $00, $01, $00, $01
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $07, $f8, $06, $f9, $00, $ff, $00, $ff
DB $03, $fc, $1f, $e0, $1f, $e0, $e0, $1f, $f0, $0f, $70, $8f, $40, $bf, $40, $bf
DB $ff, $00, $bf, $40, $bf, $40, $07, $f8, $00, $ff, $80, $7f, $00, $ff, $00, $ff
DB $f0, $0e, $f0, $0c, $f0, $0c, $c0, $3c, $00, $f8, $00, $f0, $00, $f0, $00, $e0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03
DB $00, $1e, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $7f, $3c, $c3, $3f, $c0
DB $00, $01, $00, $0f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $08, $f7, $7e, $81
DB $00, $00, $00, $00, $00, $c0, $00, $c0, $00, $c0, $00, $e0, $00, $e0, $00, $f0
DB $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $ff, $3d, $c2, $11, $ee, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $03, $3c
DB $00, $ff, $01, $fe, $77, $88, $cf, $30, $0f, $f0, $07, $f8, $0f, $f0, $fe, $01
DB $00, $ff, $e0, $1f, $e0, $1f, $c0, $3f, $c0, $3f, $88, $77, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $02, $fd, $03, $fc, $01, $fe, $01, $fe, $00, $ff
DB $80, $7f, $06, $f9, $06, $f9, $46, $b9, $fc, $03, $fc, $03, $ff, $00, $7f, $80
DB $80, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7e
DB $00, $e0, $00, $e0, $00, $c0, $00, $c0, $00, $c0, $00, $80, $00, $01, $00, $01
DB $00, $0f, $03, $0c, $07, $08, $0f, $10, $0f, $30, $0f, $30, $1f, $e0, $1f, $e0
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $00, $e0, $00, $e0, $00, $e0, $00, $f0, $00, $e0, $00, $e0, $00, $f0, $00, $f0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $03
DB $03, $1c, $01, $1e, $00, $07, $00, $07, $00, $03, $00, $03, $00, $01, $00, $c0
DB $fe, $01, $fa, $05, $ff, $00, $ff, $00, $0e, $f1, $1e, $e1, $3f, $c0, $03, $fc
DB $c0, $3f, $00, $ff, $cc, $33, $fc, $03, $78, $87, $fd, $02, $ff, $00, $ff, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $03, $fc, $0f, $f0, $3f, $c0
DB $1e, $e1, $0f, $f0, $07, $f8, $00, $ff, $03, $fc, $9f, $60, $ff, $00, $3c, $c3
DB $80, $7c, $80, $7c, $f0, $08, $60, $90, $e0, $10, $c0, $20, $00, $c0, $00, $80
DB $00, $03, $00, $03, $01, $02, $01, $02, $00, $01, $00, $01, $00, $01, $00, $00
DB $3f, $c0, $7f, $80, $ff, $00, $ff, $00, $ff, $00, $7f, $80, $1f, $e0, $01, $9e
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
DB $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $01, $f8, $06
DB $00, $f0, $80, $61, $00, $f9, $00, $ff, $80, $7f, $00, $fc, $00, $e0, $00, $80
DB $00, $7f, $00, $ff, $00, $fc, $00, $e0, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $c0, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $3f, $00, $0f, $00, $07, $00, $07, $00, $07, $00, $03, $00, $03, $00, $01
DB $8e, $71, $00, $ff, $07, $f8, $03, $fc, $01, $fe, $00, $ff, $00, $ff, $00, $ff
DB $3e, $c1, $0e, $f1, $0f, $f0, $3f, $c0, $07, $f8, $01, $fe, $00, $ff, $00, $ff
DB $60, $9f, $70, $8f, $fc, $02, $fc, $03, $fc, $03, $00, $fe, $00, $fe, $00, $fe
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $31, $00, $03, $00, $07, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00
DB $1f, $e0, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00
DB $f0, $0c, $00, $f8, $00, $38, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $7f
DB $00, $ff, $3f, $c0, $7f, $80, $7f, $80, $ff, $00, $ff, $00, $7f, $80, $00, $ff
DB $00, $f8, $f0, $0c, $f0, $0c, $f0, $0c, $f0, $08, $e0, $10, $c0, $30, $00, $e0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $0f, $00, $07
DB $00, $ff, $01, $fe, $07, $f8, $0c, $f0, $10, $e0, $60, $80, $40, $80, $80, $00
DB $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


SLP_MonaLisa_Text::
DB "  Mona Lisa   "
