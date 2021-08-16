SECTION "Puzzle UI Tileset", ROMX, BANK[4]

PuzzleUITileset::
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $18, $e7, $18, $e7, $00, $ff
DB $00, $ff, $18, $e7, $18, $e7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $1c, $e3, $22, $dd, $22, $dd, $22, $dd
DB $22, $dd, $22, $dd, $22, $dd, $1c, $e3, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $0c, $f3, $04, $fb, $04, $fb, $04, $fb
DB $04, $fb, $04, $fb, $04, $fb, $0e, $f1, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $1c, $e3, $22, $dd, $02, $fd, $04, $fb
DB $10, $ef, $20, $df, $20, $df, $3e, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $1c, $e3, $22, $dd, $02, $fd, $04, $fb
DB $02, $fd, $02, $fd, $22, $dd, $1c, $e3, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $20, $df, $20, $df, $24, $db, $24, $db
DB $3e, $c1, $04, $fb, $04, $fb, $04, $fb, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $3e, $c1, $20, $df, $20, $df, $3c, $c3
DB $02, $fd, $02, $fd, $22, $dd, $1c, $e3, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $0c, $f3, $10, $ef, $20, $df, $20, $df
DB $3c, $c3, $22, $dd, $22, $dd, $1c, $e3, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $3e, $c1, $02, $fd, $02, $fd, $04, $fb
DB $04, $fb, $08, $f7, $08, $f7, $08, $f7, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $1c, $e3, $22, $dd, $22, $dd, $1c, $e3
DB $22, $dd, $22, $dd, $22, $dd, $1c, $e3, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $1c, $e3, $22, $dd, $22, $dd, $1e, $e1
DB $02, $fd, $02, $fd, $04, $fb, $18, $e7, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
DB $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe
DB $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f
DB $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $00, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
DB $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f, $ff, $7f
DB $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
DB $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
DB $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $00
DB $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00
DB $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $00
PuzzleUITilesetEnd::

SECTION "Puzzle UI Tilemap", ROMX, BANK[4]

PuzzleUITilemap::
DB $f4, $f5, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $e0, $e0, $be, $e0, $e0, $fb, $f9, $f4
DB $f4, $f5, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $e1, $e1, $bf, $e1, $e1, $fb, $f9, $f4
; Next row to be repeated 16 times
DB $f4, $f5, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $fb, $f9, $f4
