INCLUDE "src/include/macros.inc"

SECTION "MC Vars", WRAM0

; Orientation
; 0 = front,  1 = front walking ,  2 = front walking symmetric
; 3 = back,   4 = back walking,    5 = back walking symmetric
; 6 = left,   7 = left walking,    8 = [null]
; 9 = right, 10 = right walking,  11 = [null]
wMC_Preset::
	DS 1

; Position on Screen
wMC_ScreenY::
	DS 1
wMC_ScreenX::
	DS 1
	
SECTION "MC Logic", ROMX, BANK[4]

MC_Init::
	xor a
	ld [wMC_Preset], a
	ld a, $50
	ld [wMC_ScreenY], a
	add 16
	ld [wMC_ScreenX], a	
	ret

MC_LoadTiles::
	ld hl, $8400
	ld de, MCTiles
	ld bc, MCTilesEnd
	call loadMemoryDOUBLE
	ret
	
MC_Display::	
	ld a, [wMC_Preset]
	; a*=16; a <= 11 < 16, therefore
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

DB $00, $00, $40, $00
DB $00, $08, $41, $00
DB $08, $00, $42, $00
DB $08, $08, $43, $00

MCP_FrontW::

DB $00, $00, $44, $00
DB $00, $08, $45, $00
DB $08, $00, $46, $00
DB $08, $08, $47, $00

MCP_FrontS:: ; symmetric down MCP_FrontW (basically inspired by how Pokemon Red animates its character walking)

DB $00, $00, $44, $00
DB $00, $08, $45, $00
DB $08, $00, $47, $20
DB $08, $08, $46, $20

MCP_Back0::

DB $00, $00, $48, $00
DB $00, $08, $49, $00
DB $08, $00, $4A, $00
DB $08, $08, $4B, $00

MCP_BackW::

DB $00, $00, $4C, $00
DB $00, $08, $4D, $00
DB $08, $00, $4E, $00
DB $08, $08, $4F, $00

MCP_BackS::

DB $00, $00, $4C, $00
DB $00, $08, $4D, $00
DB $08, $00, $4F, $20
DB $08, $08, $4E, $20

MCP_Left0::

DB $00, $00, $50, $00
DB $00, $08, $51, $00
DB $08, $00, $52, $00
DB $08, $08, $53, $00

MCP_LeftW::

DB $00, $00, $54, $00
DB $00, $08, $55, $00
DB $08, $00, $56, $00
DB $08, $08, $57, $00

MCP_LeftNULL::

DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00


MCP_Right0::

DB $00, $00, $51, $20
DB $00, $08, $50, $20
DB $08, $00, $53, $20
DB $08, $08, $52, $20

MCP_RightW::

DB $00, $00, $55, $20
DB $00, $08, $54, $20
DB $08, $00, $57, $20
DB $08, $08, $56, $20

MCP_RightNULL::

DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00






