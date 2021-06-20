INCLUDE "src/include/hardware.inc"
INCLUDE "src/include/macros.inc"

SECTION "Main", ROM0

MACRO loadVRAM
	ld hl, \1
	ld de, \2
	ld bc, \3
	call loadMemorySTAT
ENDM

Start::
	call waitForVBlank
	ld a, LCDCF_ON | LCDCF_BGON
	ld [rLCDC], a
	ld a, %11100100
	ld [rBGP], a
	xor a
	ld [wJoypadState], a
	ld [wJoypadPressed], a
	
	call waitForVBlank
	
	loadVRAM $8800, Tiles, TilesEnd
	loadVRAM $9800, TM, TME
	
.loop
	call updateJoypadState
	call waitForVBlank
	
	ld a, [wJoypadState]
	and PADF_UP	
	call nz, up	
	
	ld a, [wJoypadState]
	and PADF_DOWN	
	call nz, down	
	
	ld a, [wJoypadState]
	and PADF_LEFT
	call nz, left
	
	ld a, [wJoypadState]
	and PADF_RIGHT	
	call nz, right
	
	jr .loop
	
up:
	ldh a, [rSCY]
	or a
	ret z
	dec a
	ldh [rSCY], a
	ret
	
down:
	ldh a, [rSCY]
	cp a, 96
	ret z
	inc a
	ldh [rSCY], a
	ret
	
left:
	ldh a, [rSCX]
	or a
	ret z
	dec a
	ldh [rSCX], a
	ret
	
right:
	ldh a, [rSCX]
	cp a, 96
	ret z
	inc a
	ldh [rSCX], a
	ret
