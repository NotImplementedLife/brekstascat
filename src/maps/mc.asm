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
	ld hl, $8200
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

DB $00, $00, $20, $00
DB $00, $08, $21, $00
DB $08, $00, $22, $00
DB $08, $08, $23, $00

MCP_FrontW::

DB $00, $00, $24, $00
DB $00, $08, $25, $00
DB $08, $00, $26, $00
DB $08, $08, $27, $00

MCP_FrontS:: ; symmetric down MCP_FrontW (basically inspired by how Pokemon Red animates its character walking)

DB $00, $00, $24, $00
DB $00, $08, $25, $00
DB $08, $00, $27, $20
DB $08, $08, $26, $20

MCP_Back0::

DB $00, $00, $28, $00
DB $00, $08, $29, $00
DB $08, $00, $2A, $00
DB $08, $08, $2B, $00

MCP_BackW::

DB $00, $00, $2C, $00
DB $00, $08, $2D, $00
DB $08, $00, $2E, $00
DB $08, $08, $2F, $00

MCP_BackS::

DB $00, $00, $2C, $00
DB $00, $08, $2D, $00
DB $08, $00, $2F, $20
DB $08, $08, $2E, $20

MCP_Left0::

DB $00, $00, $30, $00
DB $00, $08, $31, $00
DB $08, $00, $32, $00
DB $08, $08, $33, $00

MCP_LeftW::

DB $00, $00, $34, $00
DB $00, $08, $35, $00
DB $08, $00, $36, $00
DB $08, $08, $37, $00

MCP_LeftNULL::

DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00


MCP_Right0::

DB $00, $00, $31, $20
DB $00, $08, $30, $20
DB $08, $00, $33, $20
DB $08, $08, $32, $20

MCP_RightW::

DB $00, $00, $35, $20
DB $00, $08, $34, $20
DB $08, $00, $37, $20
DB $08, $08, $36, $20

MCP_RightNULL::

DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00
DB $00, $00, $00, $00






