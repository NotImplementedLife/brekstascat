INCLUDE "src/include/macros.inc"

SECTION "ACTIONS", ROMX, BANK[2], ALIGN[8]

ActionsHub::

DW  actionNothing       ; 0
DW  actionPaletteChange ; 1


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

	
SECTION "ACTION VARS", WRAM0

PendingAction::
	DS 1
	
aPaletteIndex::
	DS 1
	
Cooldown::
	DS 1
	
