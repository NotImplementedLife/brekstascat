INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"

DLG_CLR0 EQU $F0
DLG_CLR1 EQU $F1
DLG_LINE EQU $F2
DLG_WKEY EQU $F3
DLG_STOP EQU $FF ; debug

MACRO DIALOG_LINE
	DB \1, DLG_WKEY, DLG_CLR0, DLG_CLR1
ENDM

SECTION "Dialog string", ROMX, BANK[1]

NowhereDialog::
DB "Hello there!", DLG_WKEY, DLG_CLR0, DLG_CLR1
DB "My name is Oak and welcome&nl;to the amazing world of Poke...", DLG_WKEY, DLG_CLR0, DLG_CLR1
DB "Oh, wait... Wrong line! Then... &nl;", DLG_WKEY, "Lemme...", DLG_WKEY, " Ahem!", DLG_WKEY, DLG_CLR0, DLG_CLR1

DB $FF

SECTION "NextChar", ROMX, BANK[1]
NextChar::
	ld hl, StrAddr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	cp a, $F0
	jr nc, .processFlags
	
	ld b, a
	ld hl, StrAddr+1
	inc [hl]
	ld hl, StrAddr
	xor a
	adc a, [hl]
	ld [hl], a
	ld a, b
	jp DialogPutChar
.processFlags
	ld hl, DialogOpTable
	ld bc, 3
	; find the <a> code in DialogOpTable
.loop
	cp a, [hl]
	jr z, .end
	add hl, bc
	jr .loop
.end
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a 
	call CallHL
	
	ld hl, StrAddr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	inc hl
	ld a, h
	ld [StrAddr  ], a
	ld a, l
	ld [StrAddr+1], a
	ret	

SECTION "Dialog Operations Table", ROMX, BANK[1]
	
DialogOpTable:
	
DB DLG_CLR0
DW dialog_clear_0

DB DLG_CLR1
DW dialog_clear_1

DB DLG_LINE
DW dialog_newline

DB DLG_WKEY
DW dialog_waitkey

DB DLG_STOP
DW dialog_stop

dialog_clear_0:
	ld hl, $8000
	xor a
.clearRow
	REPT(256)
	ld [hli], a
	ENDR
	ret

dialog_clear_1:
	ld hl, $8100
	xor a
	ldh [OffsetX], a
	ldh [OffsetY], a
	jp dialog_clear_0.clearRow
	ret

dialog_newline:
	ld a, 1
	ldh [OffsetY], a
	xor a
	ldh [OffsetX], a
	ret
	
dialog_waitkey:
	ld a, [DownArr]
	inc a
	ld [DownArr], a
	and 15
	srl a
	srl a
	jr z, .skipArrowUpdate
	add $27
	ld [$99F8], a
.skipArrowUpdate
	call updateJoypadState
	ld   a, [wJoypadPressed]
	and a, PADF_A
	jr z, dialog_stop ; if no key was pressed, pause dialog iteration
	
	ld a, $26
	ld [$99F8], a
	ret

dialog_stop:
	ld hl, StrAddr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	dec hl
	ld a, h
	ld [StrAddr  ], a
	ld a, l
	ld [StrAddr+1], a
	ret

SECTION "Dialog vars", WRAM0

StrAddr:: DS 2
DownArr:: DS 1

