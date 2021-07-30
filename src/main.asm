INCLUDE "src/include/macros.inc"

SECTION "Main", ROM0

Start::
	; "Zero" Shadow OAM 
	ld hl, ShadowOAM
	ld bc, 160
	call fillMemory0
	
	; Enable SRAM
	ld a, $0A
	ld [$0000], a	
	
	; Init input vars
	xor a
	ld [wJoypadState], a
	ld [wJoypadPressed], a
	
	call SRAM_CheckWritten
	
	ld a, [sNowhereIntroComplete]
	or a
	jr nz, .playIntroEnd
	
	; Run Nowhere Intro
	setBank NOWHERE_BANK
	jp Nowhere_Main
	
.playIntroEnd::
	
	setBank LOGO_BANK
	jp Logo_Main
	
	jr @
	
