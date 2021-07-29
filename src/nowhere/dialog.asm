INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"

DLG_CLR0 EQU $F0
DLG_CLR1 EQU $F1
DLG_LINE EQU $F2
DLG_WKEY EQU $F3
DLG_EXEC EQU $F4
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
DB "                                    ", DLG_CLR0, DLG_CLR1
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
DB DLG_EXEC
DW ValnyssaFadeIn_1
DB "      ", DLG_CLR0, DLG_CLR1
DB DLG_EXEC
DW ValnyssaFadeIn_2
DB "But to"
DB DLG_EXEC
DW ValnyssaFadeIn_3
DB " facil"
DB DLG_EXEC
DW ValnyssaFadeIn_4
DB "itate "
DB DLG_EXEC
DW ValnyssaFadeIn_5

DB "your under-&nl;standing, I shall tell you that\"&key;", DLG_CLR0, DLG_CLR1
DB "\"people form ancient times&nl;used to call me Valnyssa.\"&key;", DLG_CLR0, DLG_CLR1

DB "\"There isn't much time left, so&nl;I shall fill you in on what you \"&key;", DLG_CLR0, DLG_CLR1
DB "\"will soon have to deal with in&nl;order to fulfill your purpose.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"Ethereal is the core of the&nl;infinite dimension of existence.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"It provides the energy to&nl;power up the real world.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"It is also the one that models&nl;the subconscious cerebral \"&key;", DLG_CLR0, DLG_CLR1
DB "\"waves.That makes it possible&nl;for humans to dream and to\"&key;", DLG_CLR0, DLG_CLR1
DB "\"have thoughts.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"However, Ethereal is in dan-&nl;ger due to unknown evil forces&key;", DLG_CLR0, DLG_CLR1
DB "which affect the elemental&nl;entities of this world. \"&key;", DLG_CLR0, DLG_CLR1
DB "\"Therefore, gods are unable&nl;to do something in this regard\"&key;", DLG_CLR0, DLG_CLR1
DB "\"Paradoxically, you, weak&nl;ontological being, can't be\"&key;", DLG_CLR0, DLG_CLR1
DB "\"touched by something meant&nl;to destroy a deity. That's why&key;", DLG_CLR0, DLG_CLR1
DB "I shall put my faith in you, the&nl;one who can restore the \"&key;", DLG_CLR0, DLG_CLR1
DB "\"millennial order of Ethereal.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"But, there is a problem...&nl;&key;Being a living one, you can't \"&key;", DLG_CLR0, DLG_CLR1
DB "\"directly interact with the&nl;existential matter.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"Even so, there is no need to&nl;worry.\"&key;", DLG_CLR0, DLG_CLR1

DB "\"I can sandbox a part of&nl;Ethereal directly in your mind\"&key;", DLG_CLR0, DLG_CLR1
DB "\"into a shape you are familiar&nl;with. For that, you'll feel like\"&key;", DLG_CLR0, DLG_CLR1
DB "\"everything will be just an&nl; illusion, but keep in mind - \"&key;", DLG_CLR0, DLG_CLR1
DB "\"each step you do in this&nl;world, will have direct\"&key;", DLG_CLR0, DLG_CLR1
DB "consequences over Ethereal.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"Calm down, you won't slay&nl;demons - as if you'd have\"&key;", DLG_CLR0, DLG_CLR1
DB "\"the capacity to see them.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"Deep into your subconscious,&nl;you'll have the impression\"&key;", DLG_CLR0, DLG_CLR1
DB "\"you solve puzzles.&key; However,&nl;don't take it easy.\"&key;", DLG_CLR0, DLG_CLR1
DB "\"The greater the evil, the&nl;harder the puzzle you'll have\"&key;", DLG_CLR0, DLG_CLR1
DB "\"to deal with.\"&key;", DLG_CLR0, DLG_CLR1

DB " . . . . . . . . . &key;", DLG_CLR0, DLG_CLR1
DB "          ", DLG_CLR0, DLG_CLR1

REPT(4)
DB DLG_EXEC
DW ValnyssaShake_1
DB DLG_EXEC
DW ValnyssaShake_2
DB DLG_EXEC
DW ValnyssaShake_2
DB DLG_EXEC
DW ValnyssaShake_1
ENDR

DB "\"Oh, no!&key; It's too late.&key; I'm&nl;not even sure if I can safely\"&key;", DLG_CLR0, DLG_CLR1
DB "\"clone Ethereal into your mind.&nl;&key; Now, hurry up!\"&key;", DLG_CLR0, DLG_CLR1
DB "\"I shall...&key; put...&key; all my...&key;&nl;faith...&key; in you...\"&key;", DLG_CLR0, DLG_CLR1	

REPT(4)
DB DLG_EXEC
DW ValnyssaFlash_1
DB "      "
DB DLG_EXEC
DW ValnyssaFlash_2
DB "    "
ENDR
DB DLG_EXEC
DW ValnyssaNegative
DB "         "
REPT(8)
DB DLG_EXEC
DW ValnyssaShake_1
DB DLG_EXEC
DW ValnyssaShake_2
DB DLG_EXEC
DW ValnyssaShake_2
DB DLG_EXEC
DW ValnyssaShake_1
ENDR
DB DLG_EXEC
DW ValnyssaAllBlack
REPT(13)
DB DLG_EXEC
DW ValnyssaDarkBg
DB "   "
DB DLG_EXEC
DW ValnyssaNormBg
ENDR
DB DLG_EXEC
DW ValnyssaBlackBg
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_1
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_2
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_3
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_4
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_5
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_6
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_7
DB DLG_EXEC
DW ValnyssaMiniLoadTiles_8

DB DLG_EXEC
DW ValnyssaCageLoad_1
DB DLG_EXEC
DW ValnyssaCageLoad_2
DB DLG_EXEC
DW ValnyssaCageLoad_3

DB "                                             "

DB DLG_EXEC
DW ValnyssaMiniLoadOAM

DB "                "

REPT(3)
DB"          "
DB DLG_EXEC
DW ValnyssaMiniFlip
ENDR

DB DLG_EXEC
DW ValnyssaNormBg
DB "                    "

REPT(2)
DB"          "
DB DLG_EXEC
DW ValnyssaMiniFlip
ENDR

DB DLG_CLR0, DLG_CLR1
DB ". . . . . . . .&nl;meow?&key;"

DB DLG_EXEC
DW ValnyssaCageShow
DB DLG_EXEC
DW ValnyssaCageAnimateAction
; reserve time to execute action:
DB "                                                                           "
DB DLG_CLR0, DLG_CLR1
DB "Valnyssa was captured by a&nl;demonic force.&key;", DLG_CLR0, DLG_CLR1

DB "       "
DB DLG_EXEC
DW ValnyssaFadeOut_1
DB "      "
DB DLG_EXEC
DW ValnyssaFadeOut_2
DB "      "
DB DLG_EXEC
DW ValnyssaFadeOut_3
DB "      "
DB DLG_EXEC
DW ValnyssaFadeOut_4

DB DLG_EXEC
DW ValnyssaNowhereExit

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

DB DLG_EXEC
DW dialog_execute

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
	add $30
	ld [$99F8], a
.skipArrowUpdate
	call updateJoypadState
	ld   a, [wJoypadPressed]
	and a, PADF_A
	jr z, dialog_stop ; if no key was pressed, pause dialog iteration
	
	ld a, $30
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
	
dialog_execute:
	ld hl, StrAddr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	inc hl
	push hl
	inc hl
	ld a, h
	ld [StrAddr  ], a
	ld a, l
	ld [StrAddr+1], a
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CallHL
	ret

SECTION "Dialog vars", WRAM0

StrAddr:: DS 2
DownArr:: DS 1

