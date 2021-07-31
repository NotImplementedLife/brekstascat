SECTION "Breksta's Cat Logo Logic", ROMX, BANK[3]

LogoInit::
	ld hl, $8800
	ld de, BCLogoTiles
	ld bc, BCLogoTilesEnd
	call loadMemoryDOUBLE
	ret
	
LogoLoadTM::
	ld hl, $9A82
	ld bc, BCTM
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9AA2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9AC2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9AE2
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9B02
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ld hl, $9B22
	
	REPT(12)
	ld a, [bc]
	inc bc
	ld [hli], a
	ENDR
	
	ret
