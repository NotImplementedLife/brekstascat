INCLUDE "include/notes.inc"

SECTION "Nowhere music", ROMX, BANK[2], ALIGN[8]

; Unfortunately I'm not a composer 
; this song was primarly made by hitting random keys in a piano app

NowhereMusic::	
	DB C#3, C#3, ___, ___, ___, D#3, D#3, ___, ___, ___, C#3, C#3, ___, ___, ___, D#3, D#3, E_3, ___, ___, ___, ; 21
	DB C#3, C#3, ___, ___, ___, D#3, D#3, ___, ___, ___, C#3, C#3, ___, ___, ___, D#3, D#3, D_3, ___, ___, ___, ; 21
	DB D#3, C#3, C#3, F_3, C#3, D#3, D#3, ___, ___, D#3, C#3, C#3, F_3, C#3, C_3, ___, ___,                     ; 17
	DB C_3, F_3, D_3, F_3, D#3, ___, C_3, F_3, D_3, F_3, C_3, D_3, C#3, ___, ___, ___, ___,                     ; 17
	DB C_3, E_3, D_3, E_3, ___, C_3, D_3, E_3, D_3, ___, ___,                                                   ; 11
	DB D_3, F_3, E_3, F_3, ___, D_3, E_3, F_3, D_3, ___, ___,                                                   ; 11
	
	DB D_3, F_3, E_3, F_3, ___, D_3, E_3, F_3, E_3, ___, ___,                                                   ; 11
	DB E_3, G_3, F_3, G_3, ___, E_3, F_3, G_3, E_3, ___, ___,                                                   ; 11
	
	
	DB C_3, F_3, D_3, F_3, D#4, ___, ___, C_3, F_3, D_3, F_3, C#4, ___, ___,                                    ; 14
	DB C_3, F_3, D_3, F_3, A#3, ___, ___, C_3, F_3, D_3, F_3, G#3, ___, ___,                                    ; 14
	DB C_3, F_3, D_3, F_3, F_3, G_3, G#3, G_3, ___, ___, ___, F_3, G_3, G#3, F_3, ___, ___, ___                 ; 18
	
	DB C_3, D_3, E_3, F_3, C_3, D_3, E_3, F_3, C_3, D_3, E_3, F_3, G_3, D#3, ___, ___,                          ; 16 
	DB G_3, C#3, ___, G_3, A_3, C#3, F_3, ___                                                                   ;  8
	DB D_3, G#3, C_3, F_3, C_3, D_3, C_3, ___, ___, ___, ___, ___, ___, ___                                     ; 14
	DB C#3, C#3, ___, ___, ___, D#3, D#3, ___, ___, ___, C_3, C_3, ___, ___, ___, D_3, D_3, ___, ___, ___,      ; 20  
	DB C#3, C#3, C#3, ___, ___, ___, ___, ___, ___, ___, ___, D_3, D_3, D_3, ___, ___, ___, C_3, C#3, C#3,      ; 20 (+)= 244
	DB D_3, C_3, C_3, C#3, ___, ___, ___, ___, ___, ___, ___, ___     											; with this should be 256
	
SECTION "Nowhere music vars", WRAM0

wNowhereMusicOffset::
	DS 1
	
wNowhereCoolDown::
	DS 1
