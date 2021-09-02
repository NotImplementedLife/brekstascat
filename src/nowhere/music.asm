INCLUDE "include/notes.inc"

SECTION "Nowhere music", ROMX, BANK[2], ALIGN[8]

NowhereMusic::	
	REPT(10)
	DB E_3, D_3, D_3, D#3, D_3, E_3, D#3, D#3, ___, ___, E_3, D_3, D_3, D#3, D_3, E_3, D_3, D_3, F_3, E_3, ___ 
	DB E_3, D_3, D_3, D#3, D_3, E_3, D#3, D#3, ___, ___, E_3, D_3, D_3, D#3, D_3, E_3, D_3, D_3, C_3, D_3, ___ 
	DB A_3, A_3, G_3, B_3, B_3, C_3, B_3, G_3, A_3, A_3, G_3, B_3, B_3, C_3, D_3, C_3, B_3, ___
	DB A_3, G_3, B_3, C_3, D_3, C_3, B_3, D_3, C_3, A_3, G_3, B_3, C_3, D_3, B_3
	DB E_4, D_4, D_4, D#4, D_4, E_4, D#4, D#4, ___, ___, E_4, D_4, D_4, D#4, D_4, E_4, D_4, D_4, F_4, E_4, ___ 
	DB E_4, D_4, D_4, D#4, D_4, E_4, D#4, D#4, ___, ___, E_4, D_4, D_4, D#4, D_4, E_4, D_4, D_4, C_4, D_4, ___ 
	DB A_4, A_4, G_4, B_4, B_4, C_4, B_4, G_4, A_4, A_4, G_4, B_4, B_4, C_4, D_4, C_4, B_4, ___
	DB A_4, G_4, B_4, C_4, D_4, C_4, B_4, D_4, C_4, A_4, G_4, B_4, C_4, D_4, B_4
	ENDR
SECTION "Nowhere music vars", WRAM0

wNowhereMusicOffset::
	DS 1
	
wNowhereCoolDown::
	DS 1
	
wNowhereFreq::
	DS 1
