SECTION "MC Tiles", ROMX, BANK[4]

MCTiles::

; front
DB $00, $00, $0f, $0f, $1f, $1f, $3f, $3f, $3f, $38, $7f, $52, $3f, $32, $1f, $10
DB $00, $00, $c0, $c0, $f8, $f8, $fc, $fc, $fc, $0c, $fe, $4a, $fc, $4c, $f8, $08
DB $0e, $09, $0f, $0f, $38, $3f, $70, $5f, $78, $5f, $21, $3f, $12, $1e, $0c, $0c
DB $70, $90, $f0, $f0, $1c, $fc, $0e, $fa, $1e, $fa, $84, $fc, $48, $78, $30, $30
; front walking
DB $00, $00, $00, $00, $0f, $0f, $1f, $1f, $3f, $3f, $3f, $38, $7f, $52, $3f, $32
DB $00, $00, $00, $00, $c0, $c0, $f8, $f8, $fc, $fc, $fc, $0c, $fe, $4a, $fc, $4c
DB $1f, $10, $0e, $09, $0f, $0f, $38, $3f, $70, $5f, $21, $3f, $1e, $1e, $0c, $0c
DB $f8, $08, $70, $90, $f0, $f0, $1c, $fc, $0e, $fa, $cc, $fc, $30, $30, $00, $00
; back
DB $00, $00, $03, $03, $1f, $1f, $3f, $3f, $3f, $3f, $7f, $7f, $3f, $3f, $1f, $13
DB $00, $00, $f0, $f0, $f8, $f8, $fc, $fc, $fc, $fc, $fe, $fe, $fc, $fc, $f8, $c8
DB $0f, $08, $0f, $0f, $3e, $3f, $72, $5f, $78, $5f, $21, $3f, $12, $1e, $0c, $0c
DB $f0, $10, $f0, $f0, $7c, $fc, $4e, $fa, $1e, $fa, $84, $fc, $48, $78, $30, $30
; back walking
DB $00, $00, $00, $00, $03, $03, $1f, $1f, $3f, $3f, $3f, $3f, $7f, $7f, $3f, $3f
DB $00, $00, $00, $00, $f0, $f0, $f8, $f8, $fc, $fc, $fc, $fc, $fe, $fe, $fc, $fc
DB $1f, $13, $0f, $08, $0f, $0f, $3e, $3f, $7a, $5f, $33, $3f, $0c, $0c, $00, $00
DB $f8, $c8, $f0, $10, $f0, $f0, $7c, $fc, $5e, $fa, $84, $fc, $78, $78, $30, $30
; left
DB $00, $00, $0f, $0f, $0f, $0f, $0f, $0f, $1f, $11, $1f, $14, $1f, $14, $1f, $10
DB $00, $00, $00, $00, $c0, $c0, $f0, $f0, $f0, $f0, $f8, $78, $f8, $38, $f0, $70
DB $0b, $0c, $07, $07, $02, $03, $02, $03, $02, $03, $02, $03, $06, $07, $07, $07
DB $e0, $60, $e0, $e0, $a0, $60, $a0, $60, $20, $e0, $60, $e0, $60, $e0, $c0, $c0
; left walking
DB $00, $00, $00, $00, $0f, $0f, $0f, $0f, $0f, $0f, $1f, $11, $1f, $14, $1f, $14
DB $00, $00, $00, $00, $00, $00, $c0, $c0, $f0, $f0, $f0, $f0, $f8, $78, $f8, $38
DB $1f, $10, $0b, $0c, $07, $07, $02, $03, $04, $07, $1f, $1f, $0c, $0c, $00, $00
DB $f0, $70, $e0, $60, $e0, $e0, $a0, $60, $20, $e0, $18, $f8, $d8, $f8, $70, $70

; NPC - Snake

; front
DB $3f, $3f, $5f, $7c, $bf, $d0, $bb, $d6, $bf, $d0, $bf, $c8, $5f, $64, $23, $3f
DB $fc, $fc, $fa, $3e, $fd, $0b, $dd, $6b, $fd, $0b, $fd, $13, $fa, $26, $cc, $fc
DB $0f, $0c, $1b, $1d, $3b, $3c, $7b, $7c, $fd, $4e, $fe, $7f, $ff, $7e, $7e, $3f
DB $f0, $b0, $d8, $78, $dc, $3c, $de, $3e, $bf, $7e, $ff, $7e, $7f, $fe, $fe, $7c

; right
DB $01, $01, $02, $03, $05, $06, $45, $46, $25, $26, $22, $23, $21, $21, $60, $60
DB $f0, $f0, $3e, $fe, $ff, $c1, $f7, $8d, $fe, $82, $fc, $9c, $f4, $94, $f2, $93
DB $c0, $c0, $c0, $c0, $f0, $f0, $e8, $f8, $ef, $7f, $de, $7f, $5a, $3f, $3b, $1f
DB $79, $49, $58, $68, $6c, $74, $f2, $fe, $f3, $fe, $fb, $fe, $de, $fc, $dc, $f8

; left
DB $0f, $0f, $7c, $7f, $ff, $83, $ef, $b1, $7f, $41, $3f, $39, $2f, $29, $4f, $c9
DB $80, $80, $40, $c0, $a0, $60, $a2, $62, $a4, $64, $44, $c4, $84, $84, $06, $06
DB $9e, $92, $1a, $16, $36, $2e, $4f, $7f, $cf, $7f, $df, $7f, $7b, $3f, $3b, $1f
DB $03, $03, $03, $03, $0f, $0f, $17, $1f, $f7, $fe, $7b, $fe, $5a, $fc, $dc, $f8

; NPC P. - info room

; right 
DB $00, $00, $07, $07, $0f, $0f, $1f, $1f, $1d, $1f, $1f, $1b, $0f, $0f, $07, $04
DB $00, $00, $f0, $f0, $f0, $f0, $f8, $d8, $d8, $a8, $f8, $a8, $f8, $08, $d0, $30
DB $07, $07, $02, $03, $02, $03, $03, $02, $02, $03, $02, $03, $03, $03, $02, $02
DB $e0, $e0, $40, $c0, $40, $c0, $c0, $40, $40, $c0, $40, $c0, $e0, $e0, $f0, $f0

; back
DB $00, $00, $0f, $0f, $1f, $1f, $3f, $3f, $5f, $7f, $7f, $6f, $3f, $7f, $07, $3f
DB $00, $00, $f0, $f0, $f8, $f8, $fc, $fc, $fa, $fe, $fe, $f6, $fc, $fe, $e0, $fc
DB $07, $07, $1d, $1e, $38, $2f, $3c, $2f, $10, $1f, $08, $0f, $07, $07, $06, $06
DB $e0, $e0, $b8, $78, $1c, $f4, $3c, $f4, $08, $f8, $10, $f0, $e0, $e0, $60, $60


MCTilesEnd::