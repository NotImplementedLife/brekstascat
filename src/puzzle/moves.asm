INCLUDE "src/include/macros.inc"

SECTION "Puzzle Spritifier", ROM0 ; because ROM4 is already full and I don't want more than 8 banks for this game

; This creates a sprite from the tile at the tilemap position.
; Two overlapping sprites are created:
; - one sprite from the original tile, missing the black color
; - one computed sprite featuring black color
; hl = address of tile in tilemap
; e = LOW byte of address in OAM where to create the sprite
SpritifyTile::
	; compute spritified tile position
	push hl
	;wSpritifyY
	ld bc, $6800 ; -$9800
	add hl, bc
	; get SpritifyX
	ld a, l
	and $1F
	sla a
	sla a
	sla a
	add 8
	ld [wSpritifyX], a
	; get SpritifyY
	ld a, l
	and $E0
	swap a
	swap h
	add h
	;srl a + sla a
	sla a
	sla a
	add 16
	ld [wSpritifyY], a
	
	pop hl

	ld d, HIGH(ShadowOAM)
	
	ld a, [hl]
	ld b, a
	ld a, $BD ; replace it with an empty tile	
	ld [hl], a
	ld a, b
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
	ld a, [wSpritifyY]
	ld [de], a
	inc e
	ld a, [wSpritifyX]
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
	ld a, [wSpritifyY]
	ld [de], a
	inc e
	ld a, [wSpritifyX]
	ld [de], a
	inc e
	ld a, [wSpritifyIndex]
	ld [de], a
	inc e
	ld a, $10 ; use OPB1
	ld [de], a
	inc e
	
	; next spritify index
	ld a, [wSpritifyIndex]
	inc a
	and $DF
	ld [wSpritifyIndex], a
	
	ret

; This creates a 2x2 sprite from the tilemap square area whose top left corner is (hl)
SpritifyRegion2x2::
	ld e, 0
	push hl
	call waitForVBlank
	call SpritifyTile	
	pop hl
	inc l
	push hl	
	call SpritifyTile
	initOAM ShadowOAM
	pop hl	
	ld bc, $20-1
	add hl, bc
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l	
	call SpritifyTile
	initOAM ShadowOAM	
	ret

SpritifyRegion3x3::
	ld e, 0
	
	; first row
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l	
	
	push hl	
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl	
	inc l
	
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	
	; second row
	ld bc, $20-2
	add hl, bc
	push hl
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl
	inc l	
	
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l	
	
	push hl	
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl	
	
	; third row
	ld bc, $20-2
	add hl, bc
	
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l	
	
	push hl	
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl	
	inc l
	
	push hl
	call waitForVBlank
	call SpritifyTile
	initOAM ShadowOAM
	pop hl
	
	ret

SpritifyRegion4x4::
	ld e, 0
	
REPT(4)
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l	
	
	push hl	
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl	
	inc l
	
	push hl
	call waitForVBlank
	call SpritifyTile
	pop hl
	inc l
	
	push hl	
	call SpritifyTile
	initOAM ShadowOAM	
	pop hl	
	
	ld bc, $20-3
	add hl, bc
ENDR
	
ret


SECTION "Puzzle Move Executer", ROM0

; perform d = a/b, e = a%b
DivAB::
	ld d, 0
.loop:
	cp b ; if(b>a)
	jr c, .loopEnd
	sub a, b
	inc d
	jr .loop
.loopEnd:
	ld e, a
	ret

; Find tilemap address of piece pointed by wEmptyIndex

EmptyIndexToHL3x3::
	ld a, [wEmptyIndex]
	ld b, 3
	call DivAB
	; now we need hl = $9884 + $20*(4*d)+4*e = $9884 + $80*d + 4*e	
	sla e
	sla e ; e*=4
	; try to bitwise simulate de = $80*d+e = (d>>1)*$100+((d>>7)|e) 
	; or sth like that
	ld a, d
	rrca
	and $80 ; a = most significant bit of d
	or e   
	ld e, a
	srl d
	ld hl, $9884
	add hl, de ; note that de = $80 * d + e
	ret

; b = dY, c = dX
MoveStepOAM::
	ld hl, ShadowOAM
	ld d, 32
.loop
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	add c
	ld [hli], a
	inc l
	inc l
	dec d
	jr nz, .loop
	ret
	
; swap entries [b] and [c] in PuzzleMatrix
PuzMatrixSwapEntries::
	ld hl, wSPMatrix
	ld l, b
	ld d, [hl]
	ld l, c
	ld e, [hl]
	ld [hl], d
	ld l, b
	ld [hl], e
	ret

	
; routines to check if the input move is legal
; in affirmative case, update the Puzzle Matrix & perform animation

MoveFinish3x3::
	call waitForVBlank
	call PuzzleRenderFromMatrix3	
	pop af ; fake return
	ret ; return from caller function

MoveValidateDown3x3::
	ld a, [wEmptyIndex]
	cp 0
	ret z
	cp 1
	ret z
	cp 2
	ret z	
	
	ld b, a
	sub 3
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries	
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call waitForVBlank
	ld b, 4
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish3x3
	
MoveValidateUp3x3::
	ld a, [wEmptyIndex]
	cp 6
	ret z
	cp 7
	ret z
	cp 8
	ret z	
	
	ld b, a
	add 3
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call waitForVBlank
	ld b, -4
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish3x3
	
MoveValidateLeft3x3::
	ld a, [wEmptyIndex]
	cp 2
	ret z
	cp 5
	ret z
	cp 8
	ret z	
	
	ld b, a
	add 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call waitForVBlank
	ld b, 0
	ld c, -4
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish3x3
	
MoveValidateRight3x3::
	ld a, [wEmptyIndex]
	cp 0
	ret z
	cp 3
	ret z
	cp 6
	ret z	
	
	ld b, a
	sub 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call waitForVBlank
	ld b, 0
	ld c, 4
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish3x3
	
ProcessMoveInput3x3::
	bit PADB_DOWN, a
	call nz, MoveValidateDown3x3
	bit PADB_UP, a
	call nz, MoveValidateUp3x3
	bit PADB_LEFT, a
	call nz, MoveValidateLeft3x3
	bit PADB_RIGHT, a
	call nz, MoveValidateRight3x3
	ret


SECTION "Puzzle Moves Vars", WRAM0

wEmptyIndex::
	DS 1

; automatic iterator that specifies where in the $8800 tileset
; to create the graphics for the spritified tile
; the index $XY lays in the range $C0..$DF
; increment formula: $XY = ($XY + 1) & %11011111; ( <=> & $DF)
; final tile address will be $8XY0
wSpritifyIndex::
	DS 1
	
wSpritifyY::
	DS 1
	
wSpritifyX::
	DS 1
	
