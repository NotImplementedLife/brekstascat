INCLUDE "src/include/macros.inc"

SECTION "TileMap Dialog", ROMX, BANK[4]

; hl = text source
Tilemap_DialogRender::
	; move everything up 48px to make room for the dialog Window (animate)
	ld hl, rWY
	ldh a, [rSCY]
	ld b, 16
.showDialogLoop:
	push af
	call waitForVBlank
	
	ld a, [hl]
	sub 3	
	ld [hl], a
	
	pop af	
	inc a	
	ldh [rSCY], a
	
	push hl
	ld hl, ShadowOAM
	ld de, 4
	ld c, 37
.oamUpLoop:
	dec [hl]	
	add hl, de
	dec c
	jr nz, .oamUpLoop
	
	push af
	initOAM ShadowOAM
	pop af
	pop hl
	
	dec b	
	jp nz, .showDialogLoop	
	
	ld a, 1
	ld [TMDialogActive], a
	
.dialogLoop
	call waitForVBlank
	call NextChar
	
	ld a, [TMDialogActive]
	or a
	jr nz, .dialogLoop
	
	; hide dialog Window
	; make everything look as it was before
	
	ld hl, rWY
	ldh a, [rSCY]
	ld b, 16
.hideDialogLoop:
	push af
	call waitForVBlank
	
	ld a, [hl]
	add 3	
	ld [hl], a
	
	pop af
	dec a
	ldh [rSCY], a
	
	push hl
	ld hl, ShadowOAM
	ld de, 4
	ld c, 37
.oamDownLoop:
	inc [hl]	
	add hl, de
	dec c
	jr nz, .oamDownLoop
	
	push af
	initOAM ShadowOAM
	pop af
	pop hl
	
	dec b	
	jp nz, .hideDialogLoop	
	
	ret

	
Tilemap_DialogReturn::
	xor a
	ld [TMDialogActive], a	
	ret

SECTION "TM Dialog vars", WRAM0

TMDialogActive::
	DS 1
