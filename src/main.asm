INCLUDE "src/include/hardware.inc"
INCLUDE "src/include/macros.inc"

SECTION "Vars", WRAM0

X:
DS 1

SECTION "Main", ROM0

MACRO loadVRAM
	ld hl, \1
	ld de, \2
	ld bc, \3
	call loadMemorySTAT
ENDM



Start::
	ld a, $0A
	ld [$0000], a
	;ld a, $01
	;ld [$A000], a
	xor a
	ld [X], a
	call waitForVBlank
	ld a, LCDCF_ON | LCDCF_BGON
	ld [rLCDC], a
	ld a, %11100100
	ld [rBGP], a
	;ld [X], a
	
	ld a, 48
	ld [rSCX], a	
	
	xor a
	ld [wJoypadState], a
	ld [wJoypadPressed], a
	
	call waitForVBlank
	
	;loadVRAM $8800, Tiles, TilesEnd
	;loadVRAM $9800, TM, TME
	
	loadVRAM $9000, Actual_TS, Actual_TS + $800
	loadVRAM $8800, Actual_TS + $800, Actual_TS_End	
	
	loadVRAM $8000, Chars, Chars_End	
	
	loadVRAM $9800, Actual_TM, Actual_TM_End
		
	call waitForVBlank
.loop	
	.waitVRAM
    ldh a, [rSTAT]
    and STATF_BUSY ; %0000_0010
    jr nz, .waitVRAM	
	
	;ldh a, [rBGP]		
	;rlca		
	;rlca	
	;ldh [rBGP], a	
	
	ldh a, [rLY]
	cp a, 94
	jr nz, .skipLCDC	
	
	ldh a, [rLCDC]
	or LCDCF_BG8000
	ldh [rLCDC], a	
.skipLCDC:
	ldh a, [rLY]
	cp a, 143
	jr nz, .skipLCDCres
	ldh a, [rLCDC]
	and ($FF ^ LCDCF_BG8000)
	ldh [rLCDC], a	
.skipLCDCres:
	jr .loop

	ld a, %00011011
	ldh [rBGP], a	
	
	;call waitForVBlank	
	;call updateJoypadState	
	
	;xor a
	;ld [X], a
	
	jr .loop
	
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
