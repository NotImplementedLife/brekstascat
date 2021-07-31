INCLUDE "src/include/macros.inc"

SECTION "Chain Sample 5", ROMX, BANK[3], ALIGN[8]

ChainSample::
DB $6d, $92, $6d ; tile 1 (line 2, line 3, line 4)
DB $b6, $49, $b6 ; tile 2 (line 2, line 3, line 4)
DB $db, $24, $db ; tile 3 (line 2, line 3, line 4)


SECTION "Chain Vertical Tiles", ROMX, BANK[3]

ChainVerticalTiles:
DB $40, $40, $a0, $a0, $a0, $a0, $40, $40, $a0, $a0, $a0, $a0, $40, $40, $a0, $a0
DB $a0, $a0, $40, $40, $a0, $a0, $a0, $a0, $40, $40, $a0, $a0, $a0, $a0, $40, $40
DB $a0, $a0, $a0, $a0, $40, $40, $a0, $a0, $a0, $a0, $40, $40, $a0, $a0, $a0, $a0


SECTION "Chain W", WRAM0, ALIGN[8]

wChainModel:: 
	DS 9    ; here chain movement will be computed
wChainPlatform24:: 
	DS 16*6 ; here the chain will be rendered

SECTION "Chain Sample Logic", ROMX, BANK[3]

ChainModelInit::
	; vertical chain data
	xor a
	ld [wTi], a
	ld [wVStep], a
	ld a, 6
	ld [wTg], a
	; now horizontal
	ld hl, wChainModel
	ld de, ChainSample
	ld bc, 9
	jp loadMemory
	
ChainRender::
	ld hl, wChainPlatform24
	ld bc, LogoBackground_Tiles.chainPlatorm + 2
	ld de, wChainModel
	; solve chain platform (first 14 tiles)
	ld a, 14
.loop14
	push af
	
	; reset 2nd to 4th line, and draw chain
	REPT(3)	
	ld a, [bc]
	inc bc
	ld [hl], a
	
	ld a, [de]
	or [hl]
	ld [hli],a
	
	ld a, [bc]
	inc bc
	ld [hl], a
	
	ld a, [de]
	or [hl]
	ld [hli], a
	
	inc de
	ENDR
	
	ld a, e
	cp 9
	jr nz, .skip_de_reset
	ld e, 0
.skip_de_reset

	; bc+=10 [next tile]
	ld a, c
	add 10
	ld c, a
	xor a
	adc a, b	
	ld b, a
	
	pop af
	dec a
	jr nz, .loop14
	
	; solve wheels (last 2 tiles)
	
	ld de, wChainModel + 6 ; get the last model tile
	ld bc, LogoBackground_Tiles.chainPlatorm + 16*14 + 2 ; get the first wheel tile
	; hl is set form previous loop
	
	; solve first wheel ($3E)
	ld a, 3
.loop3E
	push af
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F0 ; that's what's different from the upper loop
	or [hl]
	ld [hli], a
	
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F0 
	or [hl]
	ld [hli], a
	
	inc de
	
	pop af
	dec a
	jr nz, .loop3E
	
	; solve second wheel ($3F)
	ld bc, LogoBackground_Tiles.chainPlatorm + 16*15 + 2 ; get the first wheel tile
	ld de, wChainModel + 6 ; use the same model tile (tiles $3E, $3F will be on the same position on the platform)
	
	; special tratement for first line - need to render 5 pixels, not 4
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F8 ; not $F0
	or [hl]
	ld [hli], a
	
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F8 
	or [hl]
	ld [hli], a
	
	inc de
		
	; the same as wheel 1
	ld a, 2
.loop3F
	push af
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F0 
	or [hl]
	ld [hli], a
	
	ld a, [bc]
	inc bc
	ld [hl], a
	ld a, [de]
	and $F0 
	or [hl]
	ld [hli], a
	
	inc de
	
	pop af
	dec a
	jr nz, .loop3F
	
	ret
	
ChainDraw::
	ld hl, $9302
	ld bc, wChainPlatform24
	ld de, 10
	
	ld a, 16
.loop
	push af
	REPT(6)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	add hl, de ; go to next tile
	
	pop af
	dec a
	jr nz, .loop
	
	ret

ChainMoveCircular::
	; process first line
	ld a, [wChainModel]
	ld b, a
	ld c, a
	ld a, [wChainModel+3]
	ld d, a
	ld e, a
	ld a, [wChainModel+6]
	ld h, a
	ld l, a
	
	call ChainMoveCircularHelper
	
	ld a, b
	ld [wChainModel], a
	ld a, d
	ld [wChainModel+3], a
	ld a, h
	ld [wChainModel+6], a
	
	; process second line
	ld a, [wChainModel+1]
	ld b, a
	ld c, a
	ld a, [wChainModel+4]
	ld d, a
	ld e, a
	ld a, [wChainModel+7]
	ld h, a
	ld l, a
	
	call ChainMoveCircularHelper
	
	ld a, b
	ld [wChainModel+1], a
	ld a, d
	ld [wChainModel+4], a
	ld a, h
	ld [wChainModel+7], a
	
	; process third line
	ld a, [wChainModel+2]
	ld b, a
	ld c, a
	ld a, [wChainModel+5]
	ld d, a
	ld e, a
	ld a, [wChainModel+8]
	ld h, a
	ld l, a
	
	call ChainMoveCircularHelper
	
	ld a, b
	ld [wChainModel+2], a
	ld a, d
	ld [wChainModel+5], a
	ld a, h
	ld [wChainModel+8], a
	
	ret
	
ChainMoveCircularHelper:
	
	; b <<= 2 ; c = (c & 3)
	ld a, b
	sla a
	sla a
	ld b, a
	
	ld a, c
	and 3
	ld c, a
	
	; d <<= 2 ; e = (e & 3)
	ld a, d
	sla a
	sla a
	ld d, a
	
	ld a, e
	and 3
	ld e, a
	
	; h <<= 2 ; l &= = (l & 3)
	ld a, h
	sla a
	sla a
	ld h, a
	
	ld a, l
	and 3
	ld l, a
	
	; b |= l, d |= c, h |= e
	
	ld a, b
	or e
	ld b, a
	
	ld a, d
	or l
	ld d, a
	
	ld a, h
	or c
	ld h, a
	
	ret

	
; this part corrupes the graphics if not put in a separate section (why??)
SECTION "Chain Vertical Logic", ROMX, BANK[3]
	
ChainVerticalLoadTiles::
	ld hl, $8060
	ld de, ChainVerticalTiles
	ld bc, ChainVerticalTiles + 3*16
	jp loadMemoryDOUBLE

ChainVerticalUpdate_Phase1::
	ld a, [wTg]
	ld l, a
	swap l
	ld h, $80 ; now hl=$8060, $8070 or $8080
	ld bc, $8090 ; tampon sprite resource

	ld a, [wVStep]
	ld e, a
	swap e
	ld d, HIGH(TamponSpriteMask)
	
	; the idea: TileAt[bc] = TileAt[hl] & MaskAt[de]
	
	ld a, 16
.loop
	push af
	
	ld a, [de]
	and [hl]
	ld [bc], a
	inc hl
	inc de
	inc bc
	
	pop af
	dec a
	jr nz, .loop
	
	; if wWStep = 0, define tampon sprite in OAM
	ld a, [wVStep]
	or a
	call z, DefineTamponInOAM
	
	; if wWStep = 4, reset counter and go to the next tampon
	ld a, [wVStep]
	cp 3
	call z, NextTampon
	
	ld hl, wVStep
	inc [hl]
	
	; move all sprites down 2 px
	
	ld hl, ShadowOAM
	ld bc, 4
	
	ld a, 40
.loopP
	push af
	
	inc [hl]
	inc [hl]
	add hl, bc
	
	pop af
	dec a
	jr nz, .loopP

	; cage down separate
	ld hl, ShadowOAM + 32*4
	ld bc, 4

.skipDown
	initOAM ShadowOAM
	
	ret
	
DefineTamponInOAM:
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	ld l, a
	ld h, HIGH(ShadowOAM)
	ld a, $23
	ld [hli], a
	ld a, $7E
	ld [hli], a
	ld a, $09
	ld [hli], a
	ld a, %00010000
	ld [hli], a
	ret

NextTampon:
	ld a, $FF ; because there will be a vWStep++ later to become 0
	ld [wVStep], a
	
	; set permanent tile 06..08
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	inc a
	inc a
	ld l, a
	ld h, HIGH(ShadowOAM)
	ld a, [wTg]
	ld [hl], a
	
	ld hl, wTi
	inc [hl]
	
	ld hl, wTg
	ld a, [hl]
	inc a
	cp 9
	jr nz, .skipResetG
	ld a, 6
.skipResetG
	ld [hl], a
	
	ret

SECTION "Vertical Chains Phase 2", ROMX, BANK[3]	

ChainVerticalUpdate_Phase2::
	; add vertical chains till the top of the screen
	ld a, [wTg]
	ld l, a
	swap l
	ld h, $80 ; now hl=$8060, $8070 or $8080
	ld bc, $8090 ; tampon sprite resource

	ld a, [wVStep]
	ld e, a
	swap e
	ld d, HIGH(TamponSpriteMask)
	
	; the idea: TileAt[bc] = TileAt[hl] & MaskAt[de]
	
	ld a, 16
.loop
	push af
	
	ld a, [de]
	and [hl]
	ld [bc], a
	inc hl
	inc de
	inc bc
	
	pop af
	dec a
	jr nz, .loop
	
	; if wWStep = 0, define tampon sprite in OAM
	ld a, [wVStep]
	or a
	call z, DefineTamponInOAM_2
	
	; if wWStep = 4, reset counter and go to the next tampon
	ld a, [wVStep]
	cp 3
	call z, NextTampon_2
	
	ld hl, wVStep
	inc [hl]
	
	; don't move sprites anymore
	initOAM ShadowOAM
	
	ret
	
DefineTamponInOAM_2:
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	ld l, a
	ld h, HIGH(ShadowOAM)
	; use the previous sprite position to compute current tampon Y coordinate
	REPT(4)
	dec l
	ENDR
	ld a, [hl]
	sub 8
	REPT(4)
	inc l
	ENDR
	ld [hli], a
	ld a, $7E
	ld [hli], a
	ld a, $09
	ld [hli], a
	ld a, %00010000
	ld [hli], a
	ret

NextTampon_2:
	ld a, $FF ; because there will be a vWStep++ later to become 0
	ld [wVStep], a
	
	; set permanent tile 06..08
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	inc a
	inc a
	ld l, a
	ld h, HIGH(ShadowOAM)
	ld a, [wTg]
	ld [hl], a
	
	ld hl, wTi
	inc [hl]
	
	ld hl, wTg
	ld a, [hl]
	inc a
	cp 9
	jr nz, .skipResetG
	ld a, 6
.skipResetG
	ld [hl], a
	
	ret
	
SECTION "Vertical Chains Phase 5", ROMX, BANK[3]

ChainVerticalUpdate_Phase5::
	ld a, [wTg]
	ld l, a
	swap l
	ld h, $80 ; now hl=$8060, $8070 or $8080
	ld bc, $8090 ; tampon sprite resource

	ld a, [wVStep]
	ld e, a
	swap e
	ld d, HIGH(TamponSpriteMask)
	
	; the idea: TileAt[bc] = TileAt[hl] & MaskAt[de]
	
	ld a, 16
.loop
	push af
	
	ld a, [de]
	and [hl]
	ld [bc], a
	inc hl
	inc de
	inc bc
	
	pop af
	dec a
	jr nz, .loop
	
	; if wWStep = 0, define tampon sprite in OAM
	ld a, [wVStep]
	or a
	call z, DefineTamponInOAM_5
	
	; if wWStep = 4, reset counter and go to the next tampon
	ld a, [wVStep]
	cp 3
	call z, NextTampon_5
	
	ld hl, wVStep
	inc [hl]
	
	; move all sprites down 2 px
	
	ld hl, ShadowOAM
	ld bc, 4
	
	ld a, 40
.loopP
	push af
	
	inc [hl]
	inc [hl]
	add hl, bc
	
	pop af
	dec a
	jr nz, .loopP

	; cage down separate
	ld hl, ShadowOAM + 32*4
	ld bc, 4

.skipDown
	initOAM ShadowOAM
	
	ret
	
DefineTamponInOAM_5:
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	ld l, a
	ld h, HIGH(ShadowOAM)
	ld a, $03
	ld [hli], a
	ld a, $7E
	ld [hli], a
	ld a, $09
	ld [hli], a
	ld a, %00010000
	ld [hli], a
	ret

NextTampon_5:
	ld a, $FF ; because there will be a vWStep++ later to become 0
	ld [wVStep], a
	
	; set permanent tile 06..08
	ld a, [wTi] ; get tile index
	sla a
	sla a ; a*=4
	inc a
	inc a
	ld l, a
	ld h, HIGH(ShadowOAM)
	ld a, [wTg]
	ld [hl], a
	
	ld hl, wTi
	inc [hl]
	
	ld hl, wTg
	ld a, [hl]
	inc a
	cp 9
	jr nz, .skipResetG
	ld a, 6
.skipResetG
	ld [hl], a
	
	ret
	

SECTION "Chains Clear Logic", ROMX, BANK[3]

; this gets called only once
ChainsClearBg::
	ld a, $20
	ld hl, $9860
	
	REPT(15)
	ld [hli], a
	xor 1
	ENDR
	
	ld hl, wCagePhase3Counter
	inc [hl] ; must be 1
	ret

	
SECTION "Vertical Chain Progressive Construction Vars", WRAM0

; Tampon Sprite Index in OAM (00..##)
wTi:      
	DS 1 
; Tampon Sprite Graphics [Tile #] (06..08)
wTg:
	DS 1
; Vertical "step" (0..3) - just to know how to treat the tampon sprite
wVStep: 
	DS 1

SECTION "Vertical Chain Tampon Sprite Masks", ROMX, BANK[3], ALIGN[8]

TamponSpriteMask:
; wVStep = 0
;DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 
; wVStep = 1
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF 
; wVStep = 2
DB $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
; wVStep = 3
DB $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
; wVStep = 4
DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
