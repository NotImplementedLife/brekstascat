INCLUDE "src/include/macros.inc"

SECTION "Nowhere logic", ROMX, BANK[1]


; 3*(n+1) cycles, where n = number of steps (\1)
; for the next hBlank use "burn 17"
MACRO burn
	ld a, \1                 ; 2
.burn_loop\@
	dec a                    ; 1
	jr nz, .burn_loop\@      ; 2 / 3
ENDM
	
Nowhere_Main::
	; init LSin
	ld hl, LSin
	ld b, 96
	xor a
.loadLSin
	ld [hli], a
	inc a
	dec b
	jr nz, .loadLSin
	
	; init Action variables
	ld a, 1
	ld [PendingAction], a

	ld a, 5
	ld [Cooldown], a
	
	xor a
	ld [aPaletteIndex], a
	ld [rBGP], a
	ld [DownArr], a
	
	ld a, HIGH(NowhereDialog)
	ld [StrAddr  ], a
	ld a, LOW(NowhereDialog)
	ld [StrAddr+1], a
	
	; Center horizontally
	ld a, 48
	ld [rSCX], a	
	
	xor a
	ld [rSCY], a
	
	; load font
	;loadVRAM_DOUBLE $8000, Chars              , Chars_End	
	call DialogInit
	
	; load BG96 tileset & tilemap
	loadVRAM_DOUBLE $9000, BG96_TILESET       , BG96_TILESET + $800
	loadVRAM_DOUBLE $8800, BG96_TILESET + $800, BG96_TILESET_End		
	loadVRAM_DOUBLE $9800, BG96_TILEMAP       , BG96_TILEMAP_End
	
	call waitForVBlank
	ld a, LCDCF_ON | LCDCF_BGON; | LCDCF_BG8000
	ldh [rLCDC], a
	
	call waitForVBlank	
	; "nowhere" main loop	
.loop

	; wait for hBlank to reach line 0
.line0_1
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0_1
	burn 17  ; wait HBlank to completely pass
.line0_2
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0_2
	
	; prepare for bg96 sinus loop
	ld hl, LSin
	ld bc, $60 * 256 + LOW(PSin)
	ld d, HIGH(PSin)
	; for line = 0..95 do 
	;     SCX [ line ] = PSin [ LSin [ line ] ]
	;     LSin [ line ] = (LSin [ line ] + 1) & $0F <-- keep in 0-15 range
.bg96Loop            
	wait_vram
	inc [hl]         ; 3 |  3 cyc
	ld a, [hli]      ; 2 |  5 cyc
	and $0F          ; 2 |  7 cyc
	or c             ; 1 |  8 cyc
	ld e, a          ; 1 |  9 cyc
	ld a, [de]       ; 2 | 11 cyc
	ldh [rSCX], a    ; 3 | 14 cyc
	burn 10          ; burn loop
	dec b	
	jr nz, .bg96Loop
	
	; Now we are reafy to enter in the bottom part of the screen (lines 96-114)
	; change the tile data bit in LCDC to display the dialog box
	wait_vram	
	ldh a, [rLCDC]
	xor LCDCF_BG8000
	ldh [rLCDC], a		
	; clear the mess after PSin, we don't want a misaligned dialog box :))
	ld a, 48            
	ldh [rSCX], a
	
	; if palette is changed, we don't want it to affect the dialog box
	ldh a, [rBGP]
	ld [BackupPalette], a
	ld a, %11100100
	ldh [rBGP], a
	
	burn 15
	
	; dialog loop (just burn hblanks)

	ld b, 144 - $60
.dialLoop
	wait_vram
	burn 17
	dec b
	jr nz, .dialLoop
	
	; now we set the tile data bit back, to render the next frame
	ldh a, [rLCDC]
	xor LCDCF_BG8000	
	ldh [rLCDC], a	
	; restore palette
	ld a, [BackupPalette]
	ldh [rBGP], a
	
	;burn 5
	
	; Ah, finally, vBlank :)))
	call NextChar
	
	; render one more frame, but now without updating LSin
	
	; wait for hBlank to reach line 0 (again)
.line0_1_noUpdate
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0_1_noUpdate
	burn 17  ; wait HBlank to completely pass
.line0_2_noUpdate
	wait_vram
	ldh a, [rLY]
	cp a, 0
	jr nz, .line0_2_noUpdate
	
	
	; prepare for bg96 sinus loop
	ld hl, LSin
	ld bc, $60 * 256 + LOW(PSin)
	ld d, HIGH(PSin)
	; for line = 0..95 do 
	;     SCX [ line ] = PSin [ LSin [ line ] ]
	;     don't increment LSin
.bg96Loop_noUpdate           
	wait_vram
	ld a, [hli]      ; 2 |  2 cyc
	and $0F          ; 2 |  4 cyc
	or c             ; 1 |  5 cyc
	ld e, a          ; 1 |  6 cyc
	ld a, [de]       ; 2 |  8 cyc
	ldh [rSCX], a    ; 3 | 11 cyc	
	burn 11          ; burn loop
	dec b	
	jr nz, .bg96Loop_noUpdate
	
	; Now we are reafy to enter in the bottom part of the screen (lines 96-114)
	; change the tile data bit in LCDC to display the dialog box
	wait_vram	
	ldh a, [rLCDC]
	xor LCDCF_BG8000
	ldh [rLCDC], a		
	; clear the mess after PSin, we don't want a misaligned dialog box :))
	ld a, 48            
	ldh [rSCX], a
	
	; if palette is changed, we don't want it to affect the dialog box
	ldh a, [rBGP]
	ld [BackupPalette], a
	ld a, %11100100
	ldh [rBGP], a
	
	burn 15
	
	ld b, 144 - $60
.dialLoop_noUpdate
	wait_vram
	burn 17
	dec b
	jr nz, .dialLoop_noUpdate
	
	; now we set the tile data bit back, to render the next frame
	ldh a, [rLCDC]
	xor LCDCF_BG8000	
	ldh [rLCDC], a	
	; restore palette
	ld a, [BackupPalette]
	ldh [rBGP], a
	
	burn 16
	
	; another vBlank
	
	ld d, HIGH(ActionsHub)
	ld a, [PendingAction]
	add a, a
	ld e, a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	ld h, a	
	call CallHL	
	
	
	jp .loop
	

	
	