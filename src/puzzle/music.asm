INCLUDE "src/include/macros.inc"
INCLUDE "include/notes.inc"

SECTION "Puzzle music", ROM0, ALIGN[8]

PuzzleMusic::	
	DB G#5, ___, ___, F#5, ___, ___, G#5, ___, ___, ___, ___, F_5, ___, ___, E_5, ___, 
	DB ___, D_5, ___, ___, ___, E_5, ___, F_5, ___, ___, ___, G#5, ___, ___, ___, F#5, 
	DB ___, ___, ___, G#5, ___, ___, ___, G_5, ___, ___, ___, ___, ___, G_5, ___, ___, 
	DB F_5, ___, ___, E_5, ___, ___, D_5, ___, ___, ___, G_5, ___, ___, ___, ___, ___,
	DB ___, ___, ___, G_5, ___, ___, F_5, ___, ___, E_5, ___, ___, D_5, ___, ___, F_5,
	
	DB A#5, ___, G#5, ___, A#5, ___, ___, G_5, ___, F_5, ___, E_5, ___, ___, ___, F_5,
	DB G_5, ___, ___, A#5, ___, ___, G#5, ___, ___, ___, A#5, ___, ___, A_5, ___, ___,
	DB ___, ___, A_5, ___, G_5, ___, F_5, ___, E_5, ___, ___, A_5, ___, ___, ___, ___,
	DB ___, ___, ___, A_5, ___, ___, G_5, ___, ___, F_5, ___, ___, E_5, ___, ___, G_5,
	
	DB ___, ___, ___, ___, ___, ___, ___, ___, 
	
	DB D_5, ___, ___, A_5, ___, ___, ___, D_5, ___, ___, F_5, ___, ___, ___, D_5, ___
	DB ___, G_5, ___, ___, A_5, ___, ___, ___, D_5, ___, ___, A_5, ___, ___, ___, D_5
	DB ___, ___, F_5, ___, ___, ___, D_5, ___, ___, G_5, ___, ___, E_5, ___, ___, ___

	DB ___, E_5, ___, ___, F#5, ___, ___, A_5, ___, ___, A_5, ___, ___, G#5, ___, ___
	DB ___, ___, E_5, ___, ___, A_5, ___, ___, F#5, ___, ___, F_5, ___, ___, ___, ___,
	DB ___, E_5, ___, ___, F#5, ___, ___, A_5, ___, ___, A_5, ___, ___, G#5, ___, ___
	DB ___, ___, E_5, ___, ___, A_5, ___, ___, F#5, ___, ___, F_5, ___, ___, ___, ___,
	
	DB ___, ___, ___, ___, ___, ___, ___, ___,
	;DB ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___, ___,

SECTION "Puzzle music vars", WRAM0

wPuzMusicOffset::
	DS 1
	
wPuzCoolDown::
	DS 1
	
SECTION "Puzzle Music Code", ROM0;, BANK[4]

ProcessMusicPuzzle::
	ld a, [wPuzCoolDown]
	or a
	jr nz, .skipmusic
	
.readNote:
	ld h, HIGH(PuzzleMusic)
	ld a, [wPuzMusicOffset]
	ld l, a
	inc a
	ld [wPuzMusicOffset], a
	ld a, [hl]
	
	cp $FF
	jr z, .pauseinmusic
	
	ld l, a
		
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
	ld a, 2
	ld [wPuzCoolDown], a
	ret
.skipmusic:
	ld a, [wPuzCoolDown]
	dec a
	ld [wPuzCoolDown], a
	
	ret
