INCLUDE "src/include/macros.inc"

SECTION "STAT Interrupt", ROM0[$0048]

STATInterrupt:
	jp STATHandler
	
	
	
SECTION "STAT Handler", ROM0

STATHandler:
	ld a, [rLY]
	
	ld hl, rLYC
	inc [hl]
	
    reti
	