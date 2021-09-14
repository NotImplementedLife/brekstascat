INCLUDE "src/include/macros.inc"

SECTION "TileMap Dialog", ROM0

; hl = text source
Tilemap_DialogRender::
	; move everything up 48px to make room for the dialog Window (animate)
	; I read that I could have used a LYC interrupt to disable sprites on the lines
	; that are covered by dialog but that's a too complicated change for the point 
	; I reached with this project
	ld hl, rWY
	
	ld a, [wMapsCoolDown]
	sla a
	ld [wMapsCoolDown], a
	
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
	
	; [patch] CatCoins Sprites must be static :))
	ld hl, ShadowOAM+16
	REPT(3)
	inc [hl]
	add hl, de
	ENDR
	
	push af
	initOAM ShadowOAM
	pop af
	pop hl
	
	push hl
	push bc
	push af
	call ProcessMusicDoubleCooldown
	pop af
	pop bc
	pop hl
	
	dec b	
	jp nz, .showDialogLoop	
	
	ld a, 1
	ld [TMDialogActive], a
	
.dialogLoop
	call waitForVBlank
	call NextChar
	
	call ProcessMusicDoubleCooldown
	
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
	
	; [patch] CatCoins Sprites must be static :))
	ld hl, ShadowOAM+16
	REPT(3)
	dec [hl]
	add hl, de
	ENDR
	
	push af
	initOAM ShadowOAM
	pop af
	pop hl
	
	push hl
	push bc
	push af
	call ProcessMusicDoubleCooldown
	pop af
	pop bc
	pop hl
	
	dec b	
	jp nz, .hideDialogLoop	
	
	ld a, [wMapsCoolDown]
	srl a
	ld [wMapsCoolDown], a
	
	ret

	
Tilemap_DialogReturn::
	xor a
	ld [TMDialogActive], a	
	ret

SECTION "TM Dialog vars", WRAM0

TMDialogActive::
	DS 1
