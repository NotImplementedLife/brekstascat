SECTION "Chain Sample 5", ROMX, BANK[3], ALIGN[8]

ChainSample::
DB $6d, $92, $6d ; tile 1 (line 2, line 3, line 4)
DB $b6, $49, $b6 ; tile 2 (line 2, line 3, line 4)
DB $db, $24, $db ; tile 3 (line 2, line 3, line 4)

SECTION "Chain W", WRAM0, ALIGN[8]

wChainModel:: 
	DS 9    ; here chain movement will be computed
wChainPlatform24:: 
	DS 16*3 ; here the chain will be rendered

SECTION "Chain Sample Logic", ROMX, BANK[3]

ChainModelInit::
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
