SECTION "Random", ROM0

; a = random value in range 0..b
; Implementation of the prng16 listed here: 
; https://wikiti.brandonw.net/index.php?title=Z80_Routines:Math:Random
; no pretention in terms of performance
rand::
	push bc
	ld hl, rSeed1
	ld a, [hli]
	ld l, [hl]
	ld h, a
    
    ld b,h
    ld c,l
    add hl,hl
    add hl,hl
    inc l
    add hl,bc
	
	;ld [rSeed1],hl
	ld d, h
	ld e, l
	ld hl, rSeed1
	ld [hl], d
	inc hl
	ld [hl], e
	
    ;ld hl,[rSeed2]
	ld hl, rSeed2
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
    add hl,hl
    sbc a,a
    and %00101101
    xor l
    ld l,a
    ;ld [rSeed2],hl
	ld d, h
	ld e, l
	ld hl, rSeed2
	ld [hl], d
	inc hl
	ld [hl], e
	
    add hl,bc
	pop bc
	
	ld a, h
	call DivAB
	ld a, e ; a = h%b the final result
    ret


SECTION "Random Seeds", WRAM0

rSeed1::
	DS 2
	
rSeed2::
	DS 2
	