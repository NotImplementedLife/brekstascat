; source: https://www.etsy.com/listing/1042550112/vintage-slava-desk-clock-mechanical?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=slava+11+jewels&ref=sr_gallery-1-26
; This file was generated automatically by BRKC_PuzzleMaker at 25-Aug-21 12:59:23.
; This is a sliding puzzle and must be registered in the puzzles list of BRKC.
; Possible puzzle types: 3x3 or 4x4 or 6x6.

INCLUDE "include/charmap.puzzle.inc"

; SRAM Highscore

SECTION "SLP_clock HighScore", SRAM

SLP_clock_HighScore::
  DS 3

SECTION "Sliding Puzzle clock", ROMX, BANK[6], ALIGN[8]

SLP_clock_Tiles::

DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $fe, $ef, $f7, $ef, $e2, $ec, $c7, $cc, $e4, $cc, $c6, $ce, $dd
DB $ff, $ff, $ff, $3f, $ff, $e7, $ff, $07, $7b, $a3, $3b, $53, $3b, $53, $7b, $a3
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fc, $f9, $f3, $f7, $ce, $e7, $9c, $ba
DB $ff, $ff, $f8, $f1, $c7, $af, $3e, $7d, $f0, $e8, $80, $c1, $03, $0c, $0f, $70
DB $8f, $50, $ff, $7f, $f0, $cc, $00, $00, $00, $3f, $3f, $c0, $ff, $00, $e0, $1c
DB $f0, $0f, $ff, $ff, $07, $1b, $00, $00, $00, $f8, $fc, $03, $ff, $8e, $07, $38
DB $ff, $ff, $0f, $9f, $f3, $e1, $3e, $5c, $0f, $07, $01, $c2, $80, $78, $f0, $6e
DB $ff, $ff, $ff, $ff, $ff, $ff, $7f, $ff, $9f, $3f, $cf, $e7, $73, $b7, $1d, $29
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $fe, $fc, $fd, $f9, $fb, $f2, $f6, $f1, $ec, $e2, $c8, $d4, $90, $cb
DB $70, $39, $e0, $47, $c3, $8c, $07, $98, $0c, $32, $10, $ec, $00, $f0, $00, $e0
DB $3e, $c1, $f0, $08, $c0, $01, $00, $80, $00, $40, $00, $4e, $3f, $06, $7f, $00
DB $00, $80, $00, $41, $00, $03, $07, $0b, $0a, $05, $1a, $00, $18, $b2, $9a, $20
DB $00, $00, $00, $00, $00, $c0, $e0, $20, $10, $c8, $e8, $00, $e8, $09, $09, $f0
DB $7c, $9f, $0f, $13, $03, $00, $00, $10, $02, $00, $70, $88, $fc, $02, $ce, $21
DB $0e, $86, $03, $e7, $c1, $b2, $f0, $6c, $38, $56, $1c, $08, $0c, $03, $00, $07
DB $ff, $7f, $3f, $7f, $9f, $bf, $cf, $7f, $67, $2f, $17, $33, $1b, $8b, $0d, $41
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $fe, $ff, $fe, $fe, $fc, $ff, $fd, $fd, $fd, $fa, $fa, $fb
DB $a0, $9f, $40, $3e, $40, $1e, $80, $dc, $80, $38, $00, $b8, $20, $d8, $01, $f8
DB $00, $48, $00, $00, $00, $01, $00, $01, $00, $00, $00, $4c, $3e, $1f, $7d, $3e
DB $c4, $69, $ec, $81, $ec, $81, $e4, $89, $e5, $08, $44, $a9, $7f, $0f, $9f, $2e
DB $db, $00, $da, $01, $ca, $30, $cf, $67, $c3, $e5, $c0, $80, $80, $00, $00, $00
DB $19, $e2, $4b, $b0, $03, $18, $f3, $e0, $c3, $e0, $01, $03, $00, $01, $00, $00
DB $cf, $00, $cf, $00, $cf, $20, $cf, $20, $cf, $00, $ce, $b0, $fc, $f2, $31, $48
DB $00, $01, $00, $80, $00, $84, $00, $00, $00, $01, $38, $44, $fc, $3e, $c3, $3c
DB $04, $af, $02, $f6, $03, $f9, $21, $59, $10, $2d, $00, $1c, $00, $5e, $00, $4e
DB $ff, $ff, $ff, $ff, $7f, $7f, $7f, $bf, $bf, $bf, $9f, $ff, $df, $5f, $5f, $ef
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $fa, $fa, $f6, $f9, $f4, $f7, $f4, $f7, $f4, $eb, $e8, $e7, $e8, $ef, $e8, $eb
DB $00, $e9, $00, $f0, $00, $d2, $00, $e0, $00, $a0, $00, $a4, $00, $a0, $00, $c0
DB $4a, $f0, $c3, $5c, $c3, $d4, $c3, $d4, $c3, $dc, $4a, $d1, $7f, $01, $1f, $22
DB $c0, $0c, $40, $60, $60, $04, $00, $62, $40, $00, $c0, $40, $80, $c8, $00, $80
DB $00, $00, $00, $00, $00, $00, $00, $34, $14, $2b, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $80, $3c, $80, $3c, $00, $00, $00, $00, $00, $00
DB $03, $00, $03, $01, $03, $03, $02, $05, $01, $02, $01, $02, $00, $08, $00, $00
DB $a3, $10, $83, $08, $03, $99, $47, $b8, $bb, $c5, $83, $40, $fc, $02, $10, $68
DB $00, $0f, $00, $a7, $80, $07, $00, $83, $00, $93, $01, $02, $01, $03, $00, $09
DB $6f, $0f, $2f, $6f, $2f, $77, $37, $8f, $17, $b7, $17, $f7, $17, $eb, $13, $cf
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $e8, $ef, $e8, $ef, $e8, $c7, $e8, $d7, $cb, $f4, $e2, $cd, $e2, $cd, $e2, $cd
DB $00, $c8, $00, $41, $03, $41, $03, $47, $07, $02, $07, $9e, $07, $5a, $07, $42
DB $00, $00, $f8, $90, $dc, $22, $26, $d3, $77, $02, $73, $07, $17, $a3, $b7, $42
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $80, $00, $e4, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $07, $08, $1f, $00, $30, $48, $32, $6d, $7c, $21, $7c, $62, $72, $2d, $76, $21
DB $00, $81, $c0, $e1, $60, $e4, $e0, $30, $f0, $61, $74, $28, $70, $20, $60, $70
DB $4b, $93, $4b, $b3, $0b, $f3, $4b, $b3, $4b, $b3, $43, $bb, $43, $bb, $43, $bb
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $e1, $ea, $e1, $ee, $e1, $ee, $e9, $e6, $e1, $ee, $f1, $e6, $f5, $f2, $f0, $f5
DB $03, $4f, $03, $c1, $00, $41, $00, $c8, $00, $c8, $00, $a0, $80, $24, $80, $60
DB $ae, $17, $fc, $8e, $f8, $24, $00, $00, $07, $38, $31, $4f, $64, $d1, $e5, $70
DB $00, $00, $00, $00, $00, $00, $00, $00, $80, $40, $c0, $80, $e0, $c0, $e0, $c0
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $6c, $00, $0e, $00, $08
DB $00, $00, $00, $00, $00, $00, $00, $04, $00, $06, $d0, $2f, $00, $12, $00, $00
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $01, $03, $03, $01
DB $38, $07, $1f, $02, $00, $07, $38, $44, $fe, $c0, $e3, $95, $e3, $15, $d3, $25
DB $e0, $49, $c0, $81, $00, $81, $00, $0b, $00, $03, $00, $13, $80, $17, $81, $86
DB $43, $bb, $c3, $3b, $c3, $3f, $c7, $3b, $c7, $37, $c7, $17, $87, $47, $87, $4f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $f0, $fb, $f8, $fa, $f8, $fa, $fc, $f9, $fc, $fd, $fc, $fe, $fe, $fe, $ff, $fe
DB $80, $50, $c2, $30, $40, $b8, $68, $11, $20, $7d, $3c, $80, $18, $36, $18, $0f
DB $e4, $53, $e6, $48, $66, $c8, $70, $ef, $3f, $bd, $0e, $1f, $40, $00, $00, $00
DB $e2, $65, $60, $c3, $c0, $21, $c6, $09, $9f, $37, $20, $5f, $6e, $11, $7e, $81
DB $00, $00, $00, $80, $40, $80, $00, $70, $80, $91, $c0, $00, $c1, $62, $e7, $03
DB $00, $00, $00, $00, $01, $00, $00, $07, $40, $81, $01, $00, $e1, $c1, $f1, $a2
DB $23, $00, $01, $e2, $01, $40, $38, $d5, $fe, $50, $c3, $9c, $cf, $10, $c7, $18
DB $91, $67, $81, $33, $f7, $01, $f7, $0a, $7e, $9c, $18, $25, $00, $80, $80, $00
DB $81, $a6, $83, $0c, $03, $8c, $46, $c9, $16, $09, $04, $1a, $0c, $30, $18, $64
DB $8f, $0f, $0f, $8f, $1f, $8f, $1f, $1f, $1f, $3f, $3f, $3f, $3f, $7f, $7f, $7f
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $0d, $0a, $86, $89, $87, $c2, $c3, $c1, $e1, $e0, $f0, $f0, $f8, $f8, $fc, $f8
DB $00, $90, $00, $c0, $00, $c4, $a0, $40, $90, $e9, $e8, $54, $7e, $20, $3f, $10
DB $fd, $02, $fb, $48, $73, $c8, $73, $28, $3f, $09, $0f, $34, $20, $00, $00, $84
DB $e6, $09, $ed, $02, $cd, $30, $cc, $11, $8d, $90, $0c, $0f, $0f, $06, $03, $07
DB $39, $c2, $d9, $06, $3d, $c0, $dc, $01, $dc, $00, $d8, $1c, $38, $d8, $f0, $e8
DB $f3, $09, $d9, $23, $93, $69, $c7, $3a, $7e, $fd, $18, $67, $00, $03, $00, $08
DB $80, $86, $80, $81, $00, $91, $00, $07, $05, $4a, $1f, $01, $3e, $03, $7c, $8a
DB $10, $ec, $30, $c0, $61, $91, $c3, $61, $83, $c7, $07, $87, $0f, $0f, $1f, $1f
DB $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff
DB $ff, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff
DB $fe, $fc, $00, $b5, $00, $6e, $00, $91, $03, $c8, $07, $b4, $0f, $b3, $0f, $6f
DB $0f, $1c, $07, $03, $21, $43, $10, $28, $c4, $38, $f0, $0b, $f0, $fc, $f8, $1e
DB $c0, $81, $f0, $08, $fe, $81, $ff, $60, $3f, $1e, $07, $0f, $00, $01, $00, $00
DB $00, $81, $00, $34, $00, $00, $c0, $30, $ff, $00, $ff, $c0, $ff, $7f, $07, $08
DB $c0, $20, $80, $52, $00, $80, $01, $0e, $ff, $00, $ff, $03, $ff, $ff, $c0, $38
DB $41, $02, $07, $18, $3f, $40, $ff, $07, $fe, $3c, $f0, $e8, $80, $40, $00, $00
DB $f8, $14, $f0, $61, $c2, $81, $04, $8b, $01, $3e, $07, $4b, $0f, $17, $1f, $2e
DB $3f, $3f, $00, $2a, $00, $15, $80, $58, $f0, $06, $f8, $e2, $f8, $f9, $f8, $1c
DB $ff, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff
DB $ff, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $0e, $b1, $0e, $48, $0e, $5c, $0e, $de, $0e, $77, $07, $23, $03, $6d, $00, $b9
DB $3c, $da, $1c, $0f, $0e, $1c, $1c, $0e, $1c, $3f, $fc, $f8, $f8, $f3, $e0, $02
DB $00, $60, $00, $50, $00, $c4, $00, $17, $00, $3c, $00, $eb, $00, $3b, $00, $aa
DB $00, $00, $00, $00, $00, $80, $00, $8e, $00, $3c, $00, $e3, $00, $3c, $00, $c7
DB $00, $00, $00, $00, $00, $01, $00, $71, $00, $38, $00, $c7, $00, $3c, $00, $c3
DB $00, $00, $00, $09, $00, $99, $00, $8f, $00, $f0, $00, $07, $00, $7c, $00, $8b
DB $3e, $0c, $3c, $98, $3c, $80, $3c, $d2, $0f, $5e, $0f, $13, $03, $e4, $00, $2d
DB $3c, $03, $1c, $28, $18, $25, $38, $3e, $f8, $75, $f0, $e3, $e0, $cc, $00, $b3
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff


SLP_clock_Text::
DB "    Clock     "
