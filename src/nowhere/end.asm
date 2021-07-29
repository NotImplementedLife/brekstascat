INCLUDE "src/include/macros.inc"

SECTION "Nowhere end", ROMX, BANK[2]

NowhereEnd::

	; Save progress
	ld a, 1
	ld [sNowhereIntroComplete], a
	
	jp Start.playIntroEnd ; jp back to ROM0