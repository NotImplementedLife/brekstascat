INCLUDE "src/include/macros.inc"

Valnyssa_MY EQU $30

SECTION "ACTIONS", ROMX, BANK[2], ALIGN[8]

ActionsHub::

DW  actionNothing           ; 0
DW  actionPaletteChange     ; 1
DW  actionCageAnimate       ; 2


actionNothing::
	ret
	
actionPaletteChange::
	ld a, [Cooldown]
	dec a
	ld [Cooldown], a 
	ret nz
	ld a, 3
	ld [Cooldown], a
	
	ld a, [aPaletteIndex]
	ld hl, HbOwlPalettes	
	or l
	ld l, a
	inc a
	and 7
	ld [aPaletteIndex], a
	ld a, [hl]
	ldh [rBGP], a
	ld a, [aPaletteIndex]
	cp 7
	ret nz
	xor a
	ld [PendingAction], a
	ret

actionCageAnimate::
	ld hl, $FE00
	ld bc, 1
REPT(15)
	inc [hl]
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
ENDR	
	inc [hl]
	ld a, [hl]
	cp Valnyssa_MY + 24
	ret nz
	xor a
	ld [PendingAction], a
	ret
	
SECTION "ACTION VARS", WRAM0

PendingAction::
	DS 1
	
aPaletteIndex::
	DS 1
	
Cooldown::
	DS 1
	
