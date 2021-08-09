INCLUDE "src/include/macros.inc"

; separate file because of complexity
; serves as tutorial part in Playground
SECTION "Playground Arrows Events", ROMX, BANK[4]

arrLoadTutorialMap::
	xor a
	ld [wPlayerOnArrow], a
	ld de, sTutorialMatrix
	ld b, 9
.loop
	ld a, [de] ; read matrix element
	ld l, a
	inc e ; inc de
	or a ; 0, go to the next one
	jr z, .continue
	
	; build sprite position
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
	ld e, a ; d = col index
	;ld b,b
	
	; at this point
	; d = row Index (need to tranform to px coord Y)
	; e = col Index (need to tranform to px coord X)
	; l = NPC Index (need to tranform to wMnpcData)
	
	; d = 16*d+128
	ld a, d
	swap a
	add 128
	ld d, a
	
	; e = 16*e+112
	ld a, e
	swap a
	add 112
	ld e, a
	
	; l = (l-1)*8
	dec l
	ld a, l
	add a,a
	add a,a
	add a,a
	ld l, a
	inc l ; note that wMnpcData=$XX01
	ld h, HIGH(wMnpcData)
	REPT(4)
	inc hl
	ENDR
	; now we are ready to copy coordinates
	ld [hl], d
	inc hl
	ld [hl], e
	
	pop de
.continue
	dec b
	jr nz, .loop
	
	ret

arrEventDownStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz
	
	;REPT(10)
	;call waitForVBlank
	;ENDR
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
	
	ld d, a ; position of 0
	sub 3 ; get position above
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	push af	
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
	
	; update NPC Data
	push af	
	ld hl, wMnpcData

	dec a	
	add a,a
	add a,a
	add a,a
	
	add 4
	add l
	ld l, a
	ld a, [hl]
	add 16
	ld [hl], a
	pop af
	
	
	; a*=16
	swap a
	
	ld hl, ShadowOAM
	add l
	ld l, a
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	ret
	
	
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
	
	ld d, a ; position of 0
	add 3 ; get position below
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	push af	
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
	
	; update NPC Data
	push af	
	ld hl, wMnpcData

	dec a	
	add a,a
	add a,a
	add a,a
	
	add 4
	add l
	ld l, a
	ld a, [hl]
	sub 16
	ld [hl], a
	pop af
	
	
	; a*=16
	swap a
	
	ld hl, ShadowOAM
	add l
	ld l, a
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	ret
	
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
	
	;ld b,b
	
	ld d, a ; position of 0
	dec a ; get position left
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	push af	
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
	
	; update NPC Data
	push af	
	ld hl, wMnpcData

	dec a	
	add a,a
	add a,a
	add a,a
	
	add 5
	add l
	ld l, a
	ld a, [hl]
	add 16
	ld [hl], a
	pop af
	
	
	; a*=16
	swap a
	
	ld hl, ShadowOAM+1
	add l
	ld l, a
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	inc [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	ret
	
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
	
	;ld b,b
	
	ld d, a ; position of 0
	inc a ; get position right
	ld e, a ; position of #
	
	ld hl, sTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	push af	
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
	
	; update NPC Data
	push af	
	ld hl, wMnpcData

	dec a	
	add a,a
	add a,a
	add a,a
	
	add 5
	add l
	ld l, a
	ld a, [hl]
	sub 16
	ld [hl], a
	pop af
	
	
	; a*=16
	swap a
	
	ld hl, ShadowOAM+1
	add l
	ld l, a
	
	ld b, 16
.moveLoop
	call waitForVBlank
	push hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	
	dec [hl]
	
	initOAM ShadowOAM
	pop hl
	
	dec b
	jr nz, .moveLoop
	
	ret
	
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



SECTION "Playground Arrows Vars", WRAM0, ALIGN[8]
	

wPlayerOnArrow::
	DS 1

	
