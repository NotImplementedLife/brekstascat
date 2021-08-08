INCLUDE "src/include/macros.inc"

SECTION "mActions", ROMX, BANK[4]

_mAction_NoOp::
	ret
	
_mAction_Lobby_GoDown37::
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
_mAction_Lobby_Sign_InfoRoom::
	;ld b,b
	
	ld hl, rWY
	REPT(48)
	call waitForVBlank
	dec [hl]
	dec [hl]
	ENDR
	ret

SECTION "mAction Work Ram", WRAM0

;__Lobby_GoDown37_OnlyOnce::
;DS 1
