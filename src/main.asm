INCLUDE "src/include/macros.inc"

SECTION "Main", ROM0

Start::
	; Enable SRAM
	ld a, $0A
	ld [$0000], a	
	
	; Init input vars
	xor a
	ld [wJoypadState], a
	ld [wJoypadPressed], a
	
	; Run Nowhere Intro
	setBank NOWHERE_BANK
	jp Nowhere_Main
