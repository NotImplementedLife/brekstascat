INCLUDE "src/include/macros.inc"

SECTION "Puzzle Moves", ROM0 ; because ROM4 is already full and I don't want more than 8 banks for this game

; This creates a sprite from the tile at the tilemap position.
; Two overlapping sprites are created:
; - one sprite from the original tile, missing the black color
; - one computed sprite featuring black color
; hl = address of tile in tilemap
; e = LOW byte of address in OAM where to create the sprite
SpritifyTile::
	ld d, HIGH(ShadowOAM)
	
	ld a, [hl]
	; retrieve the tile address in tileset ($8XX0, $9XX0)
	cp $80
	jr c, .set9000 ; if a < $80
.set8800:
	swap a
	ld h, a
	and $F0
	ld l, a
	ld a, h
	and $0F
	or $80
	ld h, a
	jr .setEnd
.set9000:
	swap a
	ld h, a
	and $F0
	ld l, a
	ld a, h
	and $0F
	or $90
	ld h, a
.setEnd:
	
	; bc = tile address from SpritifyIndex
	ld a, [wSpritifyIndex]
	swap a
	ld b, a
	and $F0
	ld c, a
	ld a, b
	and $0F
	or $80
	ld b, a
	
	; copy tile address to SpritifyIndex
REPT(15)
	ld a, [hli]
	ld [bc], a
	inc c ; $00-$0f, b does not change
ENDR
	; don't increment hl and bc on last step
	ld a, [hl]
	ld [bc], a
	
	; register to OAM
	ld a, $40
	ld [de], a
	inc e
	ld a, $40
	ld [de], a
	inc e
	ld a, [wSpritifyIndex]
	ld [de], a
	inc e
	inc e
	
	; next tile is just black color
	ld a, [wSpritifyIndex]
	inc a
	and $DF
	ld [wSpritifyIndex], a	
	; update bc
	swap a
	ld b, a
	and $F0
	ld c, a
	ld a, b
	and $0F
	or $80
	ld b, a
	
	; get hl to the original tile address value
	ld a, l
	and $F0
	ld l, a
	
	
REPT(8)
	ld a, [hli]
	
	cpl
	xor a, [hl] ; after this step, colors 1,2 are replaced with 0, color 0,3 are replaced with 1
	; perform a & ![hl] = !(!a | [hl])
	cpl
	or a, [hl]
	cpl
	
	ld [bc], a
	inc c
	ld [bc], a
	inc c
ENDR

	; register to OAM
	ld a, $40
	ld [de], a
	inc e
	ld a, $40
	ld [de], a
	inc e
	ld a, [wSpritifyIndex]
	ld [de], a
	inc e
	ld a, $10 ; use OPB1
	ld [de], a
	inc e
	
	initOAM ShadowOAM
	ld b,b
	ret

; This creates a sprite from the tilemap square area whose top left corner is (bc)
; and its side is d
; e.g. for bc=$9800, d=2, a sprite will be created resembling the 2x2 square at the top left of the screen
; this is intended to work only if SCX=SCY=0 and the sprite will be created on the first positions in OAM
SpritifyRegion::
	
	
	
	ret
	
SECTION "Puzzle Moves Vars", WRAM0

; automatic iterator that specifies where in the $8800 tileset
; to create the graphics for the spritified tile
; the index $XY lays in the range $C0..$DF
; increment formula: $XY = ($XY + 1) & %11011111; ( <=> & $DF)
; final tile address will be $8XY0
wSpritifyIndex::
	DS 1
	
