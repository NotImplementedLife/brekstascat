INCLUDE "src/include/macros.inc"

SECTION "Main", ROM0

Start::
	; Enable SRAM
	ld a, $0A
	ld [$0000], a
	
	
	; init random seed
	ld hl, rSeed1
	call rtcGetSeconds
	ld [hli], a
	call rtcGetMinutes
	ld [hli], a
	call rtcGetHours
	ld [hli], a
	ld a, $47
	ld [hl], a
	
	; "Zero" Shadow OAM 
	ld hl, ShadowOAM
	ld bc, 160
	call fillMemory0
	
.comeBackPoint::
	; init map engine
	call TileMap_Init
	
	
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
	setBank MAPS_BANK	
	jp Maps_Main	
	jr @
	
