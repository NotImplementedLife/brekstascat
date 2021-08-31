INCLUDE "src/include/macros.inc"

SECTION "STAT Interrupt", ROM0[$0048]

STATInterrupt:
	jp STATHandler
	
	
	
SECTION "STAT Handler", ROM0

STATHandler:
	push bc
	push de
	;ld b,b
	
	ldh a, [rLYC]
	inc a
	cp 143
	jr nz, .skip0
	xor a
.skip0
	ldh [rLYC], a
	
	
	ld b, HIGH(EndingRowData)	
	ld d, 0
	ldh a, [rLY]
	inc a
	ld c, a
	
	ldh a, [rSCY]
	add c
	jr nc, .skipD
	ld d, $20
.skipD
	rrca
	rrca
	rrca
	and %00011111
	add d
	ld c, a
	ld a, [EndingCompensateY]
	add c
	ld c, a
	ld a, [bc]
	ld d, a
	wait_vram
	ldh a, [rLCDC]
	and $EF
	or d
	ldh [rLCDC], a
	pop de
	pop bc
	
    reti
