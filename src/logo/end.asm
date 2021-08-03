INCLUDE "src/include/macros.inc"

SECTION "Logo end", ROMX, BANK[3]

LogoEnd::

	; Save progress
	ld a, 1
	ld [sNowhereIntroComplete], a
	
	jp Start.playIntroEnd ; jp back to ROM0