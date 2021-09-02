INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"


SECTION "Playground Block Top Tiles", ROMX, BANK[4], ALIGN[4]
BlockTop::
;DB $A9, $AA, $B9, $BA, 128, 112, $00, $00  ; Moving Block 1
	DB $A9, $AA  ; Moving Block 1
	DB $AB, $AC  ; Moving Block 2
	DB $AD, $AE  ; Moving Block 3
	DB $BB, $BC  ; Moving Block 4
	DB $BD, $BE  ; Moving Block 5
	DB $C9, $CA  ; Moving Block 6
	DB $CB, $CC  ; Moving Block 7
	DB $CD, $CE  ; Moving Block 8

; separate file because of complexity
; serves as tutorial part in Playground
SECTION "Playground Arrows Events", ROMX, BANK[4]

arrLoadTutorialMap::
	xor a
	ld [wPlayerOnArrow], a
	ld [wTmpY], a
	ld [wTmpX], a
	ld [wTmpBLeft], a
	ld [wTmpBRight], a
	ld de, sTutorialMatrix
	ld b, 9
	call waitForVBlank
.loop
	ld a, [de] ; read matrix element
	ld l, a
	inc e ; inc de
	or a ; 0, go to the next one
	jr z, .continue
	
	; build block position
	push de
	ld a, b
	cpl
	add 10
	ld e, a
	push hl
	call Div3 ; a/=3
	pop hl
	ld d, a ; d = row index
	add d
	add d
	ld c, a ; c = 3*d
	ld a, e
	sub c
	ld e, a ; e = col index
	;ld b,b
	
	; at this point
	; d = row Index (need to tranform to px coord Y)
	; e = col Index (need to tranform to px coord X)
	; l = Block Index (need to tranform to wMnpcData)
	
	; e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	; hl = BlockTop + (l-1)*2
	dec l
	ld a, l
	add a,a
	add LOW(BlockTop)
	ld l, a
	ld h, HIGH(BlockTop)
	
	; now we are ready to copy the tiles
	ld a, [hli] ; top left
	push hl
	
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	ld [hl], a
	pop hl	
	
	ld a, [hli] ; top right
	ld hl, $99CE ; VRAM offset + 1
	add hl, de
	ld [hl], a
	
	ld a, e
	add 32 
	ld e, a ; prepare the bottom side
	
	ld hl, $99CD
	add hl, de
	ld a, $B9 ; address of block bottom side tiles
	ld [hli], a
	inc a
	ld [hl], a
	
	
	pop de
.continue
	dec b
	jr nz, .loop
	
	ret

;-------------------------------------------------------------------------------------------------------------
arrEventDownStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz
	
	ld a, 1
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $93
	ld [$9951], a
	ld [$9971], a
	ld [$998F], a
	ld [$9990], a
	ld [$9991], a
	
	call arrLocate0
	; return if move not legal
	cp 2
	ret z
	cp 1
	ret z
	or a
	ret z
	
	push af
	ld d, a ; position of 0
	sub 3 ; get position above
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	ld b, a
	ld hl, sTutorialMatrix
	ld a, e
	add l
	ld l, a
	xor a
	ld [hl], a
	
	ld hl, sTutorialMatrix
	ld a, d
	add l
	ld l, a
	ld a, b
	ld [hl], b
	
	pop af	
	
	; retrieve Block tiles
	push af	
	; build position in matrix
	ld e, a
	push hl
	call Div3 ; a/=3
	pop hl
	ld d, a ; d = row index
	ld [wTmpY], a
	add d
	add d
	ld c, a ; c = 3*d
	ld a, e
	sub c
	ld e, a ; e = col index
	ld [wTmpX], a
	; de = position YX of hole
	dec d ; get the block above (that needs to be moved)
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	call waitForVBlank
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	ld bc, ShadowOAM+32*4+2 ; address to 'spritify' block
	ld a, [hl]
	ld [bc], a
	ld [wTmpBLeft], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld [wTmpBRight], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	
	; Restore matrix position
	ld hl, wTmpY
	ld d, [hl]
	inc hl
	ld e, [hl]
	; build sprite position
	ld hl, rSCY
	swap d
	swap e
	ld a, d
	add 96
	ld d, a
	ld a, e
	add 64
	ld e, a
	
	; write them to OAM
	ld hl, ShadowOAM+32*4
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	sub 8
	ld e, a
	ld a, d
	add 8
	ld d, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	
	initOAM ShadowOAM
	
	;ld b,b
	pop af
	
	ld hl, ShadowOAM + 32*4
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
REPT(3)
	inc [hl]
	REPT(4)
	inc hl
	ENDR
ENDR
	inc [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	; build new position of the moved block
	ld hl, wTmpY
	ld d, [hl]
	inc l
	ld e, [hl]
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	
	ld a, [wTmpBLeft]
	ld [hli], a
	ld a, [wTmpBRight]
	ld [hli], a
	ld bc, 30
	add hl, bc
	ld a, $B9
	ld [hli], a
	inc a
	ld [hl], a
	
	ld hl, ShadowOAM + 32*4
	xor a
	ld b, 16
.clearBlockFromOamLoop
	ld [hli], a
	dec b
	jr nz, .clearBlockFromOamLoop
	call waitForVBlank
	initOAM ShadowOAM
	
	jp CheckBonus
	;ret
	
	
;-------------------------------------------------------------------------------------------------------------
arrEventUpStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz

	ld a, 1
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $93
	ld [$9AD1], a
	ld [$9AF1], a
	ld [$9B0F], a
	ld [$9B10], a
	ld [$9B11], a
	
	call arrLocate0
	; return if move not legal
	cp 6
	ret z
	cp 7
	ret z
	cp 8
	ret z
	
	push af
	ld d, a ; position of 0
	add 3 ; get position below
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	ld b, a
	ld hl, sTutorialMatrix
	ld a, e
	add l
	ld l, a
	xor a
	ld [hl], a
	
	ld hl, sTutorialMatrix
	ld a, d
	add l
	ld l, a
	ld a, b
	ld [hl], b
	
	pop af	
	
	; retrieve Block tiles
	push af	
	; build position in matrix
	ld e, a
	push hl
	call Div3 ; a/=3
	pop hl
	ld d, a ; d = row index
	ld [wTmpY], a
	add d
	add d
	ld c, a ; c = 3*d
	ld a, e
	sub c
	ld e, a ; e = col index
	ld [wTmpX], a
	; de = position YX of hole
	inc d ; get the block below (that needs to be moved)
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	call waitForVBlank
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	ld bc, ShadowOAM+32*4+2 ; address to 'spritify' block
	ld a, [hl]
	ld [bc], a
	ld [wTmpBLeft], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld [wTmpBRight], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	
	; Restore matrix position
	ld hl, wTmpY
	ld d, [hl]
	inc hl
	ld e, [hl]
	; build sprite position
	ld hl, rSCY
	swap d
	swap e
	ld a, d
	add 32
	ld d, a
	ld a, e
	add 64
	ld e, a
	
	; write them to OAM
	ld hl, ShadowOAM+32*4
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	sub 8
	ld e, a
	ld a, d
	add 8
	ld d, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	
	initOAM ShadowOAM
	
	;ld b,b
	pop af
	;ld b,b
	
	ld hl, ShadowOAM + 32*4
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
REPT(3)
	dec [hl]
	REPT(4)
	inc hl
	ENDR
ENDR
	dec [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	; build new position of the moved block
	ld hl, wTmpY
	ld d, [hl]
	inc l
	ld e, [hl]
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	
	ld a, [wTmpBLeft]
	ld [hli], a
	ld a, [wTmpBRight]
	ld [hli], a
	ld bc, 30
	add hl, bc
	ld a, $B9
	ld [hli], a
	inc a
	ld [hl], a
	
	ld hl, ShadowOAM + 32*4
	xor a
	ld b, 16
.clearBlockFromOamLoop
	ld [hli], a
	dec b
	jr nz, .clearBlockFromOamLoop
	call waitForVBlank
	initOAM ShadowOAM
	
	jp CheckBonus
	;ret
	
;-------------------------------------------------------------------------------------------------------------
arrEventRightStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz
	
	ld a, 1
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $93
	ld [$9A0B], a
	ld [$9A2B], a
	ld [$9A49], a
	ld [$9A4A], a
	ld [$9A4B], a
	
	call arrLocate0
	; return if move not legal
	cp 0
	ret z
	cp 3
	ret z
	cp 6
	ret z
	
	push af
	ld d, a ; position of 0
	sub 1 ; get position left
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	ld b, a
	ld hl, sTutorialMatrix
	ld a, e
	add l
	ld l, a
	xor a
	ld [hl], a
	
	ld hl, sTutorialMatrix
	ld a, d
	add l
	ld l, a
	ld a, b
	ld [hl], b
	
	pop af	
	
	; retrieve Block tiles
	push af	
	; build position in matrix
	ld e, a
	push hl
	call Div3 ; a/=3
	pop hl
	ld d, a ; d = row index
	ld [wTmpY], a
	add d
	add d
	ld c, a ; c = 3*d
	ld a, e
	sub c
	ld e, a ; e = col index
	ld [wTmpX], a
	; de = position YX of hole
	dec e ; get the block left (that needs to be moved)
	
	;ld b,b
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	call waitForVBlank
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	ld bc, ShadowOAM+32*4+2 ; address to 'spritify' block
	ld a, [hl]
	ld [bc], a
	ld [wTmpBLeft], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld [wTmpBRight], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	
	; Restore matrix position
	ld hl, wTmpY
	ld d, [hl]
	inc hl
	ld e, [hl]
	; build sprite position
	ld hl, rSCY
	swap d
	swap e
	ld a, d
	add 64
	ld d, a
	ld a, e
	add 96
	ld e, a
	
	; write them to OAM
	ld hl, ShadowOAM+32*4
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	sub 8
	ld e, a
	ld a, d
	add 8
	ld d, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	
	initOAM ShadowOAM
	
	;ld b,b
	pop af
	;ld b,b
	
	ld hl, ShadowOAM + 32*4 + 1
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
REPT(3)
	inc [hl]
	REPT(4)
	inc hl
	ENDR
ENDR
	inc [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	; build new position of the moved block
	ld hl, wTmpY
	ld d, [hl]
	inc l
	ld e, [hl]
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	
	ld a, [wTmpBLeft]
	ld [hli], a
	ld a, [wTmpBRight]
	ld [hli], a
	ld bc, 30
	add hl, bc
	ld a, $B9
	ld [hli], a
	inc a
	ld [hl], a
	
	ld hl, ShadowOAM + 32*4
	xor a
	ld b, 16
.clearBlockFromOamLoop
	ld [hli], a
	dec b
	jr nz, .clearBlockFromOamLoop
	call waitForVBlank
	initOAM ShadowOAM
	
	jp CheckBonus
	;ret
	
;-------------------------------------------------------------------------------------------------------------
arrEventLeftStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz
	
	ld a, 1
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $93
	ld [$9A17], a
	ld [$9A37], a
	ld [$9A55], a
	ld [$9A56], a
	ld [$9A57], a
	
	call arrLocate0
	; return if move not legal
	cp 2
	ret z
	cp 5
	ret z
	cp 8
	ret z
	
	push af
	ld d, a ; position of 0
	add 1 ; get position right
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	ld b, a
	ld hl, sTutorialMatrix
	ld a, e
	add l
	ld l, a
	xor a
	ld [hl], a
	
	ld hl, sTutorialMatrix
	ld a, d
	add l
	ld l, a
	ld a, b
	ld [hl], b
	
	pop af	
	
	; retrieve Block tiles
	push af	
	; build position in matrix
	ld e, a
	push hl
	call Div3 ; a/=3
	pop hl
	ld d, a ; d = row index
	ld [wTmpY], a
	add d
	add d
	ld c, a ; c = 3*d
	ld a, e
	sub c
	ld e, a ; e = col index
	ld [wTmpX], a
	; de = position YX of hole
	inc e ; get the block right (that needs to be moved)
	
	;ld b,b
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	call waitForVBlank
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	ld bc, ShadowOAM+32*4+2 ; address to 'spritify' block
	ld a, [hl]
	ld [bc], a
	ld [wTmpBLeft], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld [wTmpBRight], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	push bc
	ld bc, 30
	add hl, bc
	pop bc
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	inc l
	inc c
	inc c
	inc c
	inc c
	ld a, [hl]
	ld [bc], a
	ld a, $B4
	ld [hl], a
	
	; Restore matrix position
	ld hl, wTmpY
	ld d, [hl]
	inc hl
	ld e, [hl]
	; build sprite position
	ld hl, rSCY
	swap d
	swap e
	ld a, d
	add 64
	ld d, a
	ld a, e
	add 32
	ld e, a
	
	; write them to OAM
	ld hl, ShadowOAM+32*4
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	sub 8
	ld e, a
	ld a, d
	add 8
	ld d, a
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	inc l
	inc l
	ld a, e
	add 8
	ld e, a
	ld [hl], d
	inc l
	ld [hl], e
	
	initOAM ShadowOAM
	
	;ld b,b
	pop af
	;ld b,b
	
	ld hl, ShadowOAM + 32*4 + 1
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
REPT(3)
	dec [hl]
	REPT(4)
	inc hl
	ENDR
ENDR
	dec [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	; build new position of the moved block
	ld hl, wTmpY
	ld d, [hl]
	inc l
	ld e, [hl]
	
	; d=0, e = 64*d+2*e
	sla e
	ld a, d
	swap a ; *16
	sla a  ; *2
	sla a  ; *2
	add e
	ld e, a
	xor a
	ld d, a
	
	ld hl, $99CD ; VRAM offset for block tiles
	add hl, de
	
	ld a, [wTmpBLeft]
	ld [hli], a
	ld a, [wTmpBRight]
	ld [hli], a
	ld bc, 30
	add hl, bc
	ld a, $B9
	ld [hli], a
	inc a
	ld [hl], a
	
	ld hl, ShadowOAM + 32*4
	xor a
	ld b, 16
.clearBlockFromOamLoop
	ld [hli], a
	dec b
	jr nz, .clearBlockFromOamLoop
	call waitForVBlank
	initOAM ShadowOAM
	
	jp CheckBonus
	;ret
	
arrEventDownStepOut::
	ld a, [wPlayerOnArrow]
	ret z
	xor a
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $94
	ld [$9951], a
	ld [$9971], a
	ld a, $A3
	ld [$998F], a
	ld [$9990], a
	ld a, $A4
	ld [$9991], a
	ret
	
arrEventUpStepOut::
	ld a, [wPlayerOnArrow]
	ret z
	xor a
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $94
	ld [$9AD1], a
	ld [$9AF1], a
	ld a, $A3
	ld [$9B0F], a
	ld [$9B10], a
	ld a, $A4
	ld [$9B11], a
	ret
	
arrEventRightStepOut::
	ld a, [wPlayerOnArrow]
	ret z
	xor a
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $94
	ld [$9A0B], a
	ld [$9A2B], a
	ld a, $A3
	ld [$9A49], a
	ld [$9A4A], a
	ld a, $A4
	ld [$9A4B], a
	ret
	
arrEventLeftStepOut::
	ld a, [wPlayerOnArrow]
	ret z
	xor a
	ld [wPlayerOnArrow], a
	call waitForVBlank
	ld a, $94
	ld [$9A17], a
	ld [$9A37], a
	ld a, $A3
	ld [$9A55], a
	ld [$9A56], a
	ld a, $A4
	ld [$9A57], a
	ret
	
	
	
; a = position of 0 in TutorialMatrix
arrLocate0::
	ld b, 0
	ld hl, sTutorialMatrix
.loop
	ld a, [hli]
	or a
	jr z, .fin
	inc b
	ld a, b
	cp 8
	jr nz, .loop
.fin
	ld a, b
	ret
	
SECTION "Div 3 Table", ROMX, BANK[4], ALIGN[4]

Div3Table:

DB 0, 0, 0, 1, 1, 1, 2, 2, 2

; a = a / 3 - 11 cyc
Div3::
	ld hl, Div3Table ; 3
	add l            ; 1
	ld l, a          ; 1
	ld a, [hl]       ; 2
	ret              ; 4
	
SECTION "Playground arrows check bonus", ROM0

CheckBonus::
	ld a, [sTutorialBonusGiven]
	or a
	ret nz
	
	ld a, [sTutorialMatrix]
	or a
	ret nz
	
	ld hl, sTutorialMatrix+1
	ld b, 8
.loop
	ld a, [hli]
	cp b
	ret nz
	dec b
	jr nz, .loop
	
	
	ld a, 1
	ld [sTutorialBonusGiven], a
	
	ld a, 10
	ld [wCCReward], a
	
	ld a, HIGH( BonusAwardedString )
	ld [StrAddr], a
	ld a, LOW( BonusAwardedString )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	ld c, 10
.loopCoins
	push bc
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	call TileMap_Execute_OnlyMovQ
	pop bc
	ld hl, sCatCoins
	ld a, [hl]
	add 1
	daa
	cp $51
	jr nc, .pocketsFull
	ld [hl], a
	dec c
	jr nz, .loopCoins
	
	xor a
	ld [wCCReward], a
	ret
	
.pocketsFull
	; executes if players attempt to get more than 50 Cat Coins
	ld a, $50
	ld [sCatCoins], a
	
	ld a, HIGH( PocketsFullNotice )
	ld [StrAddr], a
	ld a, LOW( PocketsFullNotice )	
	ld [StrAddr + 1], a	
	call Tilemap_DialogRender
	
	xor a
	ld [wCCReward], a
	
	ret

BonusAwardedString::
	DB "You received 10 Cat Coins!", $F3, $F0, $F1, $F4
	DW Tilemap_DialogReturn


SECTION "Playground Arrows Vars", WRAM0, ALIGN[3]
	

wPlayerOnArrow::
	DS 1
	
wTmpY::
	DS 1
wTmpX::
	DS 1
	
wTmpBLeft::
	DS 1
wTmpBRight::
	DS 1

	
