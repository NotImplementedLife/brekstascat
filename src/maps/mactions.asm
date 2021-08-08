SECTION "mActions", ROMX, BANK[4]

_mAction_NoOp::
	ret
	
_mAction_Lobby_GoDown37::
	ld de, MovQInstr_Down
	jp MovQueueLaunch
	
_mAction_Lobby_Sign_InfoRoom::
	ld a, HIGH(DialogString_ToInfoRoom)
	ld [StrAddr], a
	ld a, LOW(DialogString_ToInfoRoom)	
	ld [StrAddr + 1], a	
	jp Tilemap_DialogRender
	
_mAction_Lobby_Sign_Playground::
	ld a, HIGH(DialogString_ToPlayground)
	ld [StrAddr], a
	ld a, LOW(DialogString_ToPlayground)	
	ld [StrAddr + 1], a	
	jp Tilemap_DialogRender
	

SECTION "mAction Work Ram", WRAM0

;__Lobby_GoDown37_OnlyOnce::
;DS 1
