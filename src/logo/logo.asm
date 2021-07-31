SECTION "Breksta's Cat Logo Logic", ROMX, BANK[3]

LogoInit::
	ld hl, $8800
	ld de, BCLogoTiles
	ld bc, BCLogoTilesEnd
	call loadMemoryDOUBLE
	ret
	
LogoLoadTM::
	ld hl, $9842
	ld bc, BCTM
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9862
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9882
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $98A2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $98C2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $98E2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ret
