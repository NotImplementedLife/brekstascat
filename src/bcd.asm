SECTION "BCD", ROM0

MakeBCD::
	ld c, a
	and 7
	ld b, a
	ld a, c
	srl a
	srl a
	srl a
	ld c, a
	xor a
	inc c
.loop8
	dec c
	jr z, .end8
	add 8
	daa
	jr .loop8
.end8

	inc b
.loop
	dec b
	ret z
	add 1
	daa
	jr .loop
	ret
