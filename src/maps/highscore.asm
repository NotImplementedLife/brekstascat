INCLUDE "src/include/macros.inc"

SECTION "Highscore table", ROM0

; converts a from charmap.puzzle to charmap
; this is because puzzle names are saved in a different charmap
; than the one used by dialog's VWF
MACRO fixCharmap
	sub $90
	push hl
	ld l, a
	ld h, HIGH(fixChMLookup)
	ld a, [hl]
	pop hl
ENDM

; copies a 16-tiles row from $8000 to an 8-ALIGN-ed location
; e = HIGH(destination)
CopyVRAMLine::
	ld d, $80
	xor a
	ld l, a
	ld h, d
	ld bc, 256
	add hl, bc
	ld b, h
	ld c, l
	ld l, a
	ld h, e
	ld e, a
	jp loadMemoryDOUBLE
	
; retrieve puzzle name & time as strings
; hl = puzzle address
HS_GetPuzzleData::
	ld a, [hli]
	ld b, a ; Bank
	ld a, [hli]
	ld c, a ; High(tilesaddr)
	ld a, [hli]
	ld h, [hl]
	ld l, a ; read high score address
	
	xor a
	ld [$4000], a ; SRAM0
	push bc
	ld bc, HighScoreLine_Timer
	ld a, [hli] ; h
	
	cp 8 ; if hour=8, time is undefined
	jr nz, .proceedNormally
	ld a, $0E ; "-" in charmap
	ld [bc], a
	inc bc
	
	ld a, $2C ; ":" in charmap
	ld [bc], a
	inc bc
	
	ld a, $0E
	ld [bc], a
	inc bc
	ld [bc], a
	inc bc
	
	ld a, $2C ; ":" in charmap
	ld [bc], a
	inc bc
	
	ld a, $0E
	ld [bc], a
	inc bc
	ld [bc], a
	inc bc
	
	jr .timercpyEnd
.proceedNormally:
	ld [bc], a
	inc bc
	
	ld a, $2C ; ":" in charmap
	ld [bc], a
	inc bc
	
	ld a, [hli] ; m
	ld d, a
	and $F0
	swap a
	ld [bc], a
	inc bc
	
	ld a, d
	and $0F
	ld [bc], a
	inc bc
	
	ld a, $2C ; ":" in charmap
	ld [bc], a
	inc bc
	
	ld a, [hli] ; s
	ld d, a
	and $F0
	swap a
	ld [bc], a
	inc bc
	
	ld a, d
	and $0F
	ld [bc], a
.timercpyEnd
	pop bc
	
	setBank b
	; hl = puzzle tiles address + $900 = string address
	ld a, c
	add 9
	ld h, a
	ld l, 0
	
.skipSpacesLeft:
		ld a, [hl]		
		inc a ; cp $FF
		jr nz, .skipSpacesLeftEnd
		inc l
	jr .skipSpacesLeft
.skipSpacesLeftEnd:
	
	ld bc, HighScoreLine_Name
	; copy the remained string
.copyString
	ld a, [hli]
	fixCharmap
	ld [bc], a
	inc bc
	
	ld a, 14
	cp l
	jr nz, .copyString
	
	ld a, $F0
	ld [bc], a
	
	ret
	
HS_RenderPuzzleData::
	push de
	xor a
	ld [OffsetX], a
		
	ld hl, HighScoreLine_Name
	ld a, h
	ld [StrAddr], a
	ld a, l
	ld [StrAddr + 1], a
.loopM
	push hl
	call waitForVBlank
	call NextChar
	pop hl
	inc hl
	ld a, $F0 ; DLG_CLR0
	cp [hl]
	jr nz, .loopM
	
	ld hl, HighScoreLine_Timer
	ld a, h
	ld [StrAddr], a
	ld a, l
	ld [StrAddr + 1], a
	
	ld a, 92
	ld [OffsetX], a
	ld b, 7
.loopT
	push bc
	call waitForVBlank
	call NextChar
	pop bc
	dec b
	jr nz, .loopT
	pop de
	call CopyVRAMLine
	
	ld hl, DialogCleaner
	ld a, h
	ld [StrAddr], a
	ld a, l
	ld [StrAddr + 1], a
	call waitForVBlank
	call NextChar
	
	ret
	
; copies a 16-tiles row to Background
; d  = starting tile id
DisplayLine::
	ld hl, HighScoreLine_Offset
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [HighScoreTile_Offset]
	ld d, a
	ld e, 8
.loop
	wait_vram
	ld a, d
	ld [hli], a
	inc d
	ld a, d
	ld [hli], a
	inc d
	
	dec e
	jr nz, .loop
	
	ld a, d
	ld [HighScoreTile_Offset], a

	ld de, 16
	add hl, de
	ld a, h
	ld [HighScoreLine_Offset], a
	ld a, l
	ld [HighScoreLine_Offset + 1], a
	
	ret
	
; hl = puzzle list address
DisplayPuzzleListHighScore::
	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	
	ld a, $98
	ld [HighScoreLine_Offset], a
	ld a, $02
	ld [HighScoreLine_Offset+1], a
	ld a, $80
	ld [HighScoreTile_Offset], a
	
	push hl
	
	; clear background
	ld hl, $9800
	ld b, 0
	ld a, $FC
.clBkg
	push af
	wait_vram
	pop af
	REPT(4)
	ld [hli], a
	ENDR
	dec b
	jr nz, .clBkg
	
	; clear OAM
	
	ld hl, ShadowOAM
	xor a
	ld b, 40
.clOAM
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .clOAM
	call waitForVBlank
	initOAM ShadowOAM
	
	
	; display title
	pop hl
	; check if hl = addres list of 3x3, 4x4, 5x5 or 6x6 puzzles
	; check only l register (all puzzles lists don't reach 256 bytes
	; therefore l is unique for each address)
	ld a, l
	push hl
	
	cp LOW(_3x3_PuzzlesList)
	call z, setHS3
	cp LOW(_4x4_PuzzlesList)
	call z, setHS4
	cp LOW(_5x5_PuzzlesList)
	call z, setHS5
	cp LOW(_6x6_PuzzlesList)
	call z, setHS6
	
	ld a, h
	ld [StrAddr], a
	ld a, l
	ld [StrAddr + 1], a
	
	ld a, 16
	ld [OffsetX], a
.loop
	push hl
	call waitForVBlank
	call NextChar
	pop hl
	inc hl
	ld a, $F0 ; DLG_CLR0
	cp [hl]
	jr nz, .loop

	ld e, $88
	call CopyVRAMLine
	call waitForVBlank
	call NextChar ; clear

	call DisplayLine
	; add 32 once more - go to next line
	ld de, 32
	add hl, de
	ld a, h
	ld [HighScoreLine_Offset], a
	ld a, l
	ld [HighScoreLine_Offset + 1], a
	
	pop hl
	
	ld a, [hli]
	ld c, a
	ld b, 0
.loadPuzzlesLoop
	push hl
	push bc
	call HS_GetPuzzleData
	pop bc
	ld a, b
	add $89
	ld e, a
	push bc
	call HS_RenderPuzzleData
	pop bc
	call DisplayLine
	pop hl
	
	inc b
	dec c
	inc hl
	inc hl
	inc hl
	inc hl
	jr nz, .loadPuzzlesLoop
	
	setBank 4
	
	ret
	
setHS3::
	ld hl, HighScore_Easy
	ret
	
setHS4::
	ld hl, HighScore_Medium
	ret
	
setHS5::
	ld hl, HighScore_Hard
	ret
	
setHS6::
	ld hl, HighScore_Master
	ret

	
SECTION "Highscore Charmap fixer lookup", ROM0, ALIGN[8]

fixChMLookup::
	; $90: A-Z
	DB $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29
	; $AA: a-s
	DB $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F, $40, $41, $42
	; $BC - $F3
	REPT($F3-$BC)
	DB $00
	ENDR
	; $F4: t-z
	DB $43, $44, $45, $46, $47, $48, $49
	REPT($FE-$FA)
	DB $00
	ENDR
	DB $2A
	
DialogCleaner::
	DB $F0


SECTION "Highscore item WRAM", WRAM0
	
HighScoreLine_Name::
	DS 15 ; puzzle name (14) + ending flag ($F0)
	
HighScoreLine_Timer::
	DS 7  ; H:MM:SS
	
HighScoreLine_Offset::
	DS 2
	
HighScoreTile_Offset::
	DS 1
