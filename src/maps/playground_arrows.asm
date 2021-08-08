INCLUDE "src/include/macros.inc"

; separate file because of complexity
; serves as tutorial part in Playground
SECTION "Playground Arrows Events", ROMX, BANK[4]


arrInit::
	xor a
	ld [wPlayerOnArrow], a
	ld [wTutorialMatrix+8], a
	ld hl, wTutorialMatrix
	ld b, 8
.loop
	inc a
	ld [hli], a
	dec b
	jr nz, .loop
	
	ret

arrEventDownStepOn::
	; don't fire the event if player already on tile
	ld a, [wPlayerOnArrow]
	or a
	ret nz
	
	REPT(10)
	call waitForVBlank
	ENDR
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
	
	ld hl, wTutorialMatrix
	add l
	ld l, a
	ld a, [hl]
	
	; update TutorialMatrix
	push af	
	ld b, a
	ld hl, wTutorialMatrix
	ld a, e
	add l
	ld l, a
	xor a
	ld [hl], a
	
	ld hl, wTutorialMatrix
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
	
	ld a, [hl]
	inc a
	ld [hl], a
	
	inc hl
	inc hl
	inc hl
	inc hl
	
	ld a, [hl]
	inc a
	ld [hl], a
	
	inc hl
	inc hl
	inc hl
	inc hl
	
	ld a, [hl]
	inc a
	ld [hl], a
	
	inc hl
	inc hl
	inc hl
	inc hl
	
	ld a, [hl]
	inc a
	ld [hl], a
	
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
	
; a = position of 0 in TutorialMatrix
arrLocate0::
	ld b, 0
	ld hl, wTutorialMatrix
.loop
	ld a, [hli]
	or a
	jr z, .fin
	inc b
	cp 8
	jr nz, .loop
.fin
	ld a, b
	ret


SECTION "Playground Arrows Vars", WRAM0, ALIGN[8]

wTutorialMatrix::
	DS 9  ; 3x3, 1..8, 0 = free square
	

wPlayerOnArrow::
	DS 1
	

	