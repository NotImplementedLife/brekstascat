SECTION "mActions", ROMX, BANK[4]

_mAction_NoOp::
	ret
	
_mAction_Lobby_GoDown37::
	ld de, MovQInstr_Down
	jp MovQueueLaunch

SECTION "mAction Work Ram", WRAM0

;__Lobby_GoDown37_OnlyOnce::
;DS 1
