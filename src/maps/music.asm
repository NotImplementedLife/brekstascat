INCLUDE "src/include/macros.inc"
INCLUDE "include/notes.inc"

SECTION "Maps music", ROM0, ALIGN[8]

MapsMusic::	
	REPT(2)
	DB E_3, D_3, D_3, D#3, D_3, E_3, D#3, D#3, ___, ___, E_3, D_3, D_3, D#3, D_3, E_3, D_3, D_3, F_3, E_3, ___ 
	DB E_3, D_3, D_3, D#3, D_3, E_3, D#3, D#3, ___, ___, E_3, D_3, D_3, D#3, D_3, E_3, D_3, D_3, C_3, D_3, ___ 
	DB A_3, A_3, G_3, B_3, B_3, C_3, B_3, G_3, A_3, A_3, G_3, B_3, B_3, C_3, D_3, C_3, B_3, ___
	DB A_3, G_3, B_3, C_3, D_3, C_3, B_3, D_3, C_3, A_3, G_3, B_3, C_3, D_3, B_3
	DB E_4, D_4, D_4, D#4, D_4, E_4, D#4, D#4, ___, ___, E_4, D_4, D_4, D#4, D_4, E_4, D_4, D_4, F_4, E_4, ___ 
	DB E_4, D_4, D_4, D#4, D_4, E_4, D#4, D#4, ___, ___, E_4, D_4, D_4, D#4, D_4, E_4, D_4, D_4, C_4, D_4, ___ 
	DB A_4, A_4, G_4, B_4, B_4, C_4, B_4, G_4, A_4, A_4, G_4, B_4, B_4, C_4, D_4, C_4, B_4, ___
	DB A_4, G_4, B_4, C_4, D_4, C_4, B_4, D_4, C_4, A_4, G_4, B_4, C_4, D_4, B_4
	ENDR
SECTION "Maps music vars", WRAM0

wMapsMusicOffset::
	DS 1
	
wMapsCoolDown::
	DS 1
	
SECTION "Maps Music Code", ROM0

ProcessMusicDoubleCooldown::
	ld a, [wMapsCoolDown]
	or a
	jr nz, .skipmusic
	
.readNote:
	ld h, HIGH(MapsMusic)
	ld a, [wMapsMusicOffset]
	ld l, a
	inc a
	ld [wMapsMusicOffset], a
	ld a, [hl]
	
	cp $FF
	jr z, .pauseinmusic
	
	ld l, a
	
	ld a, $80
	ldh [rNR52], a
		
	ldh a, [rNR51]
	or $22
	ldh [rNR51], a
	
	ld a, $77
	ldh [rNR50], a
	
	ld  a, $82
	ldh [rNR21], a
	ld  a, $a4
	ldh [rNR22], a
	
	ld h, HIGH(MusicalNotes)
	inc l
	ld a, [hld]
	ldh [rNR23], a
	
	ld a, [hl]
	or $80
	ldh [rNR24], a
	
.pauseinmusic:
	ld a, 14
	ld [wMapsCoolDown], a
	ret
.skipmusic:
	ld a, [wMapsCoolDown]
	dec a
	ld [wMapsCoolDown], a
	
	ret
