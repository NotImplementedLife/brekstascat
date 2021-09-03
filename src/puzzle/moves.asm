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
	xor a 
	ld [de], a ; palette 0
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
	call ProcessMusicPuzzle
	pop hl
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
	
	;push hl
	;call waitForVBlank
	;call SpritifyTile
	;pop hl
	;inc l	
	
	;push hl	
	;call SpritifyTile
	;initOAM ShadowOAM	
	;pop hl	
	;inc l
	
	;push hl
	;call waitForVBlank
	;call SpritifyTile
	;pop hl
	;inc l
	
	;push hl	
	;call SpritifyTile
	;initOAM ShadowOAM	
	;pop hl	
	
	;ld bc, $20-3
	;add hl, bc

	;push hl
	;call ProcessMusicPuzzle
	;pop hl
	
	ld b, 4
.loop
	push bc
;REPT(2)
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
	call ProcessMusicPuzzle
	pop hl
	
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
	
	pop bc
	dec b
	jr nz, .loop
;ENDR

	;push hl
	;call ProcessMusicPuzzle
	;pop hl

	;push hl
	;call waitForVBlank
	;call SpritifyTile
	;pop hl
	;inc l	
	
	;push hl	
	;call SpritifyTile
	;initOAM ShadowOAM	
	;pop hl	
	;inc l
	
	;push hl
	;call waitForVBlank
	;;call SpritifyTile
	;pop hl
	;inc l
	
	;push hl	
	;call SpritifyTile
	;initOAM ShadowOAM	
	;pop hl	
	
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
	
; works in the following combo:
; ld a, [wEmptyIndex]
; cp {some value that a should not take}
; jp z, IllegalMove ; technically {ret z; {from Executer} ret {from Input checker}}
IllegalMove::
	pop af ; fake return 
	ret ; return from caller

SECTION "Puzzle Executer 3x3", ROM0

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
	
; routines to check if the input move is legal
; in affirmative case, update the Puzzle Matrix & perform animation

MoveFinish3x3::
	call PuzzleRenderFromMatrix3	
	pop af ; fake return
	ret ; return from caller function

MoveValidateDown3x3::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 1
	jp z, IllegalMove
	cp 2
	jp z, IllegalMove
	
	ld b, a
	sub 3
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries	
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
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
	jp z, IllegalMove
	cp 7
	jp z, IllegalMove
	cp 8
	jp z, IllegalMove
	
	ld b, a
	add 3
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
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
	jp z, IllegalMove
	cp 5
	jp z, IllegalMove
	cp 8
	jp z, IllegalMove
	
	ld b, a
	add 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
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
	jp z, IllegalMove
	cp 3
	jp z, IllegalMove
	cp 6
	jp z, IllegalMove
	
	ld b, a
	sub 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL3x3	
	call SpritifyRegion4x4
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
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
	jp PuzzleCheckComplete

SECTION "Puzzle Executer 4x4", ROM0

; Find tilemap address of piece pointed by wEmptyIndex

EmptyIndexToHL4x4::
	ld a, [wEmptyIndex]
	ld b, 4
	call DivAB
	; now we need hl = $9884 + $20*(3*d)+3*e	
	ld a, e
	sla e
	add e
	ld e, a ; e *= 3
	
	ld a, d
	sla d
	add d
	ld d, a ; d *= 3
		
	swap a
	rlca
	
	ld d, a
	and $F0
	or e
	ld e, a
	ld a, d
	and $0F
	ld d, a
	
	ld hl, $9884
	add hl, de ; note that de = $60 * d + e
	ret
	
; routines to check if the input move is legal
; in affirmative case, update the Puzzle Matrix & perform animation

MoveFinish4x4::
	call PuzzleRenderFromMatrix4
	pop af ; fake return
	ret ; return from caller function

MoveValidateDown4x4::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 1
	jp z, IllegalMove
	cp 2
	jp z, IllegalMove
	cp 3
	jp z, IllegalMove
	
	ld b, a
	sub 4
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries	
	call EmptyIndexToHL4x4	
	call SpritifyRegion3x3
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 3
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish4x4
	
MoveValidateUp4x4::
	ld a, [wEmptyIndex]
	cp 12
	jp z, IllegalMove
	cp 13
	jp z, IllegalMove
	cp 14
	jp z, IllegalMove
	cp 15
	jp z, IllegalMove
	
	ld b, a
	add 4
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL4x4	
	call SpritifyRegion3x3
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, -3
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish4x4
	
MoveValidateLeft4x4::
	ld a, [wEmptyIndex]
	cp 3
	jp z, IllegalMove
	cp 7
	jp z, IllegalMove
	cp 11
	jp z, IllegalMove
	cp 15
	jp z, IllegalMove
	
	ld b, a
	add 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL4x4	
	call SpritifyRegion3x3
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, -3
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish4x4
	
MoveValidateRight4x4::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 4
	jp z, IllegalMove
	cp 8
	jp z, IllegalMove
	cp 12
	jp z, IllegalMove
	
	ld b, a
	sub 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL4x4	
	call SpritifyRegion3x3
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, 3
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish4x4
	
ProcessMoveInput4x4::
	bit PADB_DOWN, a
	call nz, MoveValidateDown4x4
	bit PADB_UP, a
	call nz, MoveValidateUp4x4
	bit PADB_LEFT, a
	call nz, MoveValidateLeft4x4
	bit PADB_RIGHT, a
	call nz, MoveValidateRight4x4
	jp PuzzleCheckComplete
	
SECTION "Puzzle Executer 5x5", ROM0

; Find tilemap address of piece pointed by wEmptyIndex

EmptyIndexToHL5x5::
	ld a, [wEmptyIndex]
	ld b, 5
	call DivAB
	; now we need hl = $98A5 + $20*(2*d)+2*e = $98A5 + (d<<6) + 2*e
	; note that d,e = 0..24 (5 bits)
	sla e
	
	ld a, d
	rrca 
	rrca 
	ld d, a
	
	and $C0
	or e
	ld e, a
	
	ld a, d
	and $3F
	ld d, a
	
	ld hl, $98A5
	add hl, de ; note that de = $40 * d + e	
	ret
	
; routines to check if the input move is legal
; in affirmative case, update the Puzzle Matrix & perform animation

MoveFinish5x5::
	call PuzzleRenderFromMatrix5
	pop af ; fake return
	ret ; return from caller function

MoveValidateDown5x5::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 1
	jp z, IllegalMove
	cp 2
	jp z, IllegalMove
	cp 3
	jp z, IllegalMove
	cp 4
	jp z, IllegalMove
	
	ld b, a
	sub 5
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries	
	call EmptyIndexToHL5x5	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 2
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish5x5
	
MoveValidateUp5x5::
	ld a, [wEmptyIndex]	
	cp 20
	jp z, IllegalMove
	cp 21
	jp z, IllegalMove
	cp 22
	jp z, IllegalMove
	cp 23
	jp z, IllegalMove
	cp 24
	jp z, IllegalMove
	
	ld b, a
	add 5
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL5x5	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, -2
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish5x5
	
MoveValidateLeft5x5::
	ld a, [wEmptyIndex]
	cp 4
	jp z, IllegalMove
	cp 9
	jp z, IllegalMove
	cp 14
	jp z, IllegalMove
	cp 19
	jp z, IllegalMove
	cp 24
	jp z, IllegalMove
	
	ld b, a
	add 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL5x5	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, -2
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish5x5
	
MoveValidateRight5x5::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 5
	jp z, IllegalMove
	cp 10
	jp z, IllegalMove	
	cp 15
	jp z, IllegalMove
	cp 20
	jp z, IllegalMove
	
	ld b, a
	sub 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL5x5	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, 2
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish5x5
	
ProcessMoveInput5x5::
	bit PADB_DOWN, a
	call nz, MoveValidateDown5x5
	bit PADB_UP, a
	call nz, MoveValidateUp5x5
	bit PADB_LEFT, a
	call nz, MoveValidateLeft5x5
	bit PADB_RIGHT, a
	call nz, MoveValidateRight5x5
	jp PuzzleCheckComplete
	
SECTION "Puzzle Executer 6x6", ROM0

; Find tilemap address of piece pointed by wEmptyIndex

EmptyIndexToHL6x6::
	ld a, [wEmptyIndex]
	ld b, 6
	call DivAB
	; now we need hl = $98A5 + $20*(2*d)+2*e = $98A5 + (d<<6) + 2*e
	; note that d,e = 0..35 (6 bits)
	sla e
	
	ld a, d
	rrca 
	rrca 
	ld d, a
	
	and $C0
	or e
	ld e, a
	
	ld a, d
	and $3F
	ld d, a
	
	ld hl, $9884
	add hl, de ; note that de = $40 * d + e	
	ret
	
; routines to check if the input move is legal
; in affirmative case, update the Puzzle Matrix & perform animation

MoveFinish6x6::
	call PuzzleRenderFromMatrix6
	pop af ; fake return
	ret ; return from caller function

MoveValidateDown6x6::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 1
	jp z, IllegalMove
	cp 2
	jp z, IllegalMove
	cp 3
	jp z, IllegalMove
	cp 4
	jp z, IllegalMove
	cp 5
	jp z, IllegalMove
	
	ld b, a
	sub 6
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries	
	call EmptyIndexToHL6x6	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call waitForVBlank
	ld b, 2
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish6x6
	
MoveValidateUp6x6::
	ld a, [wEmptyIndex]	
	cp 30
	jp z, IllegalMove
	cp 31
	jp z, IllegalMove
	cp 32
	jp z, IllegalMove
	cp 33
	jp z, IllegalMove
	cp 34
	jp z, IllegalMove
	cp 35
	jp z, IllegalMove
	
	ld b, a
	add 6
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL6x6	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, -2
	ld c, 0
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish6x6
	
MoveValidateLeft6x6::
	ld a, [wEmptyIndex]
	cp 5
	jp z, IllegalMove
	cp 11
	jp z, IllegalMove
	cp 17
	jp z, IllegalMove
	cp 23
	jp z, IllegalMove
	cp 29
	jp z, IllegalMove
	cp 35
	jp z, IllegalMove
	
	ld b, a
	add 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL6x6
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, -2
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish6x6
	
MoveValidateRight6x6::
	ld a, [wEmptyIndex]
	cp 0
	jp z, IllegalMove
	cp 6
	jp z, IllegalMove
	cp 12
	jp z, IllegalMove	
	cp 18
	jp z, IllegalMove
	cp 24
	jp z, IllegalMove
	cp 30
	jp z, IllegalMove
	
	ld b, a
	sub 1
	ld [wEmptyIndex], a
	ld c, a
	
	call PuzMatrixSwapEntries
	call EmptyIndexToHL6x6	
	call SpritifyRegion2x2
	
	ld e, 8
.loop
	call ProcessMusicPuzzle
	call waitForVBlank
	ld b, 0
	ld c, 2
	call MoveStepOAM
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	jp MoveFinish6x6
	
ProcessMoveInput6x6::
	bit PADB_DOWN, a
	call nz, MoveValidateDown6x6
	bit PADB_UP, a
	call nz, MoveValidateUp6x6
	bit PADB_LEFT, a
	call nz, MoveValidateLeft6x6
	bit PADB_RIGHT, a
	call nz, MoveValidateRight6x6
	jp PuzzleCheckComplete
	

SECTION "Puzzle Check Complete", ROM0
	
PuzzleCheckComplete::
	ld hl, wSPMatrix
	ld c, 1
	ld a, [wPuzzle_MSize]
	dec a
	ld b, a
	; check if wSPMatrix = 1,2,3,....,wPuzzle_MSize-1
.loop
	ld a, [hli]
	cp c
	ret nz
	inc c
	dec b
	jr nz, .loop
	
	; puzzle complete, stop timer
	xor a
	ld [$6000], a
	inc a
	ld [$6000], a	
	ld a, $0C
	ld [$4000], a
	ld a, [$A000]
	set 6, a ; HALT
	ld [$A000], a
	
	call PuzzleLoadDataTilesetNoBorder
	call PuzzleDisplayFull
	
	xor a
	ld b, 40
	ld hl, ShadowOAM
.clOamLoop
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .clOamLoop	
	call waitForVBlank
	initOAM ShadowOAM
	call waitForVBlank
	call RenderTimer ; just to make sure everything is correct
	
	; spritify timer
	ld a, $C0
	ld [wSpritifyIndex], a
	ld e, 0
	
	ld hl, $980A
	
	ld b, 7
.loopTimer1
	push bc
	push hl
	call waitForVBlank
	call SpritifyTile	
	initOAM ShadowOAM
	pop hl
	ld a, $FF   ; instead of $FB that SpritifyTile leaves on that tile
	ld [hli], a 
	pop bc
	
	ld a, e
	sub 4
	ld e, a
	
	dec b
	jr nz, .loopTimer1
	
	ld hl, $982A
	
	ld b, 7
.loopTimer2
	push bc
	push hl
	call waitForVBlank
	call SpritifyTile	
	initOAM ShadowOAM
	pop hl
	ld a, $FF   ; instead of $FB that SpritifyTile leaves on that tile
	ld [hli], a 
	pop bc
	
	ld a, e
	sub 4
	ld e, a
	
	dec b
	jr nz, .loopTimer2
	
	ld hl, ShadowOAM + $38 ; clear sprite 15 (spritifying redundancy)
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	
	call waitForVBlank
	initOAM ShadowOAM
	call waitForVBlank
	
	ld c, 30
.centerTimerLoop
	ld hl, ShadowOAM + 1
	ld b, 14
	.innerLoop
		dec [hl]
		inc l
		inc l
		inc l
		inc l
		dec b
		jr nz, .innerLoop
	call waitForVBlank
	initOAM ShadowOAM
	
	ld a, c
	and 1
	jr nz, .scrollEnd
	
	ldh a, [rSCY]
	inc a
	ldh [rSCY], a
	
.scrollEnd
	dec c
	jr nz, .centerTimerLoop
	
	; update coins
	ld a, [wPuzzle_Size]
	
	cp 3
	call z, give1Coin
	
	cp 4
	call z, give2Coins
	
	cp 5
	call z, give3Coins
	
	; actually comepleting Master puzzle doesn't give coins,
	; but set reward anyway for coding reasons
	cp 6
	call z, give3Coins
	
	ld a, b
	ld [wCCReward], a
	
	; update time score
	; c = seconds, d = minutes, e = hours
	ld hl, $A000
	
	ld a, $08
	ld [$4000], a
	ld c, [hl]
	ld a, $09
	ld [$4000], a
	ld d, [hl]
	ld a, $0A
	ld [$4000], a
	ld e, [hl]
	
	; transform all to BCD
	ld a, c
	call MakeBCD
	ld c, a
	
	ld a, d
	call MakeBCD
	ld d, a
	
	ld a, e
	call MakeBCD
	ld e, a
	
	; compare to saved time and decide if highscore
	ld hl, wPuzzleSaveAddress
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	xor a 
	ld [$4000], a ; SRAM 0
	
	
	ld a, [hli] ; read hours
	cp e ; c=1 if current hours (=e) > saved hours (=a)
	jr c, .puzzleFinish ; not a high
	jr nz, .isHighscore
	; get here if crtHours == savHours
	
	ld a, [hli] ; read minutes
	cp d ; c=1 if current mins (=d) > saved mins (=a)
	jr c, .puzzleFinish ; not a high
	jr nz, .isHighscore
	; get here if crtMins == savMins
	
	ld a, [hli] ; read seconds
	cp c
	jr c, .puzzleFinish ; not a high
	jr nz, .isHighscore
	; get here if crtSecs == savSecs
	; a very unlucky situation...
	jr .puzzleFinish
	
.isHighscore:
	; save it
	ld hl, wPuzzleSaveAddress
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	ld a, e ; h
	ld [hli], a
	ld a, d ; m
	ld [hli], a
	ld a, c ; s
	ld [hli], a
	
	; perform a crappy high score animation
	;ld b,b
	call waitForVBlank
	ld a, %11000100
	ldh [rOBP1], a
	
	ld hl, ShadowOAM + 14 * 4
	ld de, HighScoreMessageOAM
	ld bc, HighScoreMessageOAMEnd-HighScoreMessageOAM
	call loadMemory
	call waitForVBlank
	initOAM ShadowOAM
	ld c, 0
.hsLoop
	call waitForVBlank
	inc c
	inc c
	ld a, c
	cp $80
	push af
	call c, showBGP1
	pop af
	call nc, hideBGP1
	
	call updateJoypadState
	ld a, [wJoypadPressed]
	jr nz, .ret
	jr .hsLoop
	
.puzzleFinish:

.waitLoop
	call updateJoypadState
	ld a, [wJoypadPressed]
	jr z, .waitLoop

.ret:
	
	pop af ; fake return
	
	; now find the caller entry by puzzle size and exit game loop
	
	ld a, [wPuzzle_Size]
	
	cp 3
	jp z, _mAction_EnterPuzzleRoomE.end
	
	cp 4
	jp z, _mAction_EnterPuzzleRoomM.end
	
	cp 5
	jp z, _mAction_EnterPuzzleRoomH.end
	
	;cp 6
	jp _mAction_EnterPuzzleRoomX.end
	
showBGP1::
	ld a, %11000100
	ldh [rOBP1], a
	ret
hideBGP1::
	xor a
	ldh [rOBP1], a
	ret

give1Coin::
	ld b, 1
	ret
	
give2Coins:: ; 2^2
	ld b, 4
	ret
	
give3Coins:: ; 3^2
	ld b, 9
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
	
