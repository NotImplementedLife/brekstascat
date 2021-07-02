INCLUDE "src/include/macros.inc"

SECTION "ACTIONS", ROMX, BANK[1], ALIGN[8]

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
	ld a, 15
	ld [Cooldown], a
	ldh a, [rBGP]
	rlca
	;adc a,0
	rlca
	;adc a,0	
	ldh [rBGP], a
	ret

	
SECTION "ACTION VARS", WRAM0

PendingAction::
	DS 1
	
Cooldown::
	DS 1
	
