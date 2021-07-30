; not bank 3, maybe I'll use this sometime later
SECTION "Valnyssa Micro Tiles", ROM0

ValnyssaMicroCat_Tiles::
; micro cat
DB $00, $00, $00, $00, $04, $04, $0c, $0c, $1f, $1f, $3f, $3f, $7f, $57, $77, $3f
DB $00, $00, $00, $00, $20, $20, $60, $60, $f0, $f0, $fd, $fd, $ff, $bb, $bc, $f4
DB $3c, $3f, $1f, $1f, $0f, $0f, $0f, $0f, $1f, $1f, $3f, $3f, $3f, $3f, $7f, $63
DB $f7, $f7, $ff, $fc, $ee, $ec, $ec, $ec, $f6, $f6, $fc, $fc, $f8, $f8, $fc, $1c

ValnyssaMicroCage_Tiles::
; micro cage
DB $0f, $0f, $12, $12, $22, $22, $22, $22, $52, $52, $52, $52, $52, $52, $52, $52 ; top half
DB $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $ff, $ff ; bottom half


SECTION "Valnyssa Micro Tiles Loader", ROMX, BANK[3]

ValnyssaMicroLoadTiles::
	ld hl, $8000
	ld de, ValnyssaMicroCat_Tiles
	ld bc, ValnyssaMicroCat_Tiles + 4*16
	call loadMemoryDOUBLE
	
	ld hl, $8040
	ld de, ValnyssaMicroCage_Tiles
	ld bc, ValnyssaMicroCage_Tiles + 2*16
	call loadMemoryDOUBLE
	ret

