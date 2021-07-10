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

SECTION "Dialog string", ROMX, BANK[2]

NowhereDialog::
DB "                                           ", DLG_CLR0, DLG_CLR1 ; spaces for artificial delay
DB "Hello there!", DLG_WKEY, DLG_CLR0, DLG_CLR1
DB "My name is Oak and welcome&nl;to the amazing world of Poke...                ", DLG_WKEY, DLG_CLR0, DLG_CLR1
DB "Oh, wait... Wrong line!&key; Alright... &nl;&key;Now...&key; Then...&key; Hmmmm... &key; What...&key;", DLG_CLR0, DLG_CLR1
DB "What was I about to say?&key;", DLG_CLR0, DLG_CLR1
DB "That aside, where am I?&key;", DLG_CLR0, DLG_CLR1
DB ". . . . . . . . . . . . . . . . . .                            &nl;&key;", DLG_CLR0, DLG_CLR1
DB "                                           ", DLG_CLR0, DLG_CLR1
DB "\"Of no significance is where&nl;you are, nor how you got here\"&key;", DLG_CLR0, DLG_CLR1
DB "\"All that matters is that you are a living one. You are\"&key;", DLG_CLR0, DLG_CLR1
DB "\"given the mission to protect&nl;the holy world of Ethereal.\"&key;", DLG_CLR0, DLG_CLR1
DB "                                           ", DLG_CLR0, DLG_CLR1
DB "HUH???&key; A mission??&key;", DLG_CLR0, DLG_CLR1
DB "Such a...&key; lifeless...&key; voice...&key;&nl;Who is speaking? &nl;&key;", DLG_CLR0, DLG_CLR1 
DB "                            ", DLG_CLR0, DLG_CLR1
DB "\"In this place, identity does&nl;not matter.\" &nl;&key;", DLG_CLR0, DLG_CLR1
DB "\"There is no who, as there&nl; is no why.\" &nl;&key;", DLG_CLR0, DLG_CLR1
; make the cat sprite appear
DB "\"But to facilitate your under-&nl;standing, I shall tell you that\"&key;", DLG_CLR0, DLG_CLR1
DB "\"people form ancient times&nl;used to call me Valnyssa.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"There isn't much time left, so&nl;.......\"&key;", DLG_CLR0, DLG_CLR1


DB $FF

SECTION "NextChar", ROMX, BANK[2]
NextChar::
	ld hl, StrAddr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	;ld b,b
	cp a, $F0
	jr nc, .processFlags
	
	ld b, a
	inc hl
	ld a, h
	ld [StrAddr  ], a
	ld a, l
	ld [StrAddr+1], a
	ld a, b
	jp DialogPutChar;
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

SECTION "Dialog Operations Table", ROMX, BANK[2]
	
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

