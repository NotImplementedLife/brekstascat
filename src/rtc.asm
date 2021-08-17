SECTION "RTC", ROM0

rtcReset::
	xor a
	ld [$6000], a
	inc a
	ld [$6000], a	
	ld a, $0C
	ld [$4000], a
	ld a, [$A000]
	set 6, a ; HALT
	ld [$A000], a
	
	ld hl, $A000
	ld b, 0
	
	ld a, $08
	ld [$4000], a
	ld [hl], b
REPT(4)
	inc a
	ld [$4000], a
	ld [hl], b
ENDR
	ret
	
rtcGetSeconds::
	ld a, 0
	ld [$6000], a
	ld a, 1
	ld [$6000], a
	ld a, $08
	ld [$4000], a
	ld a, [$A000]
	push bc
	call MakeBCD
	
	nop
	nop
	nop
	nop
	ld b, a
	xor a
	ld [$4000], a
	ld a, b
	pop bc
	ret
	
rtcGetMinutes::
	ld a, 0
	ld [$6000], a
	ld a, 1
	ld [$6000], a
	ld a, $09
	ld [$4000], a
	ld a, [$A000]
	push bc
	call MakeBCD
	
	nop
	nop
	nop
	nop
	ld b, a
	xor a
	ld [$4000], a
	ld a, b
	pop bc
	ret
	
rtcGetHours::
	ld a, 0
	ld [$6000], a
	ld a, 1
	ld [$6000], a
	ld a, $0A
	ld [$4000], a
	ld a, [$A000]
	push bc
	call MakeBCD
	
	nop
	nop
	nop
	nop
	ld b, a
	xor a
	ld [$4000], a
	ld a, b
	pop bc
	ret
