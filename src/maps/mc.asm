INCLUDE "src/include/macros.inc"

SECTION "MC Vars", WRAM0

; Orientation
; 0 = front, 1 = back, 2 = left, 3 = right
wMC_Orientation::
	DS 1
	
wMC_Walking::
	DS 1

; Position on Screen
wMC_ScreenY::
	DS 1
wMC_ScreenX::
	DS 1
	
SECTION "MC Logic", ROMX, BANK[4]

MC_Init::
	xor a
	ld [wMC_Orientation], a
	ld [wMC_Walking], a
	ld a, $50
	ld [wMC_ScreenY], a
	add 16
	ld [wMC_ScreenX], a	
	ret

MC_LoadTiles::
	ld hl, $8200
	ld de, MCTiles
	ld bc, MCTilesEnd
	call loadMemoryDOUBLE
	ret
	
MC_Display::	
	; build the preset address:
	; a = (3*wMC_Orientation + wMC_Walking)
	ld a, [wMC_Orientation]
	ld b, a
	rlc b
	add b
	ld hl, wMC_Walking
	add [hl]
	;ld b,b
	; a*=16; a <= 3*3+1 = 10 < 16, therefore
	swap a
	ld l, a
	ld h, HIGH(MCP_Front0)
	; now we have the presets address in hl
	; copy it to ShadowOAM >> OAM while updating screen X/Y
	
	ld a, [wMC_ScreenY]
	ld b, a
	ld a, [wMC_ScreenX]
	ld c, a
	ld de, ShadowOAM
	
	ld a, 4
.loop
	push af
	ld a, b
	add [hl]
	ld [de], a
	inc l
	inc e ; ShadowOAM is ALIGN[8]
	ld a, c
	add [hl]
	ld [de], a
	inc l
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	pop af
	dec a
	jr nz, .loop
	
	initOAM ShadowOAM
	
	ret

SECTION "MC Sprite Presets", ROMX, BANK[4], ALIGN[8]

MCP_Front0::

DB $00, $00, $20, $00
DB $00, $08, $21, $00
DB $08, $00, $22, $00
DB $08, $08, $23, $00

MCP_FrontW::

DB $00, $00, $24, $00
DB $00, $08, $25, $00
DB $08, $00, $26, $00
DB $08, $08, $27, $00

MCP_FrontS::

DB $00, $00, $24, $00
DB $00, $08, $25, $00
DB $08, $00, $27, $20
DB $08, $08, $26, $20
