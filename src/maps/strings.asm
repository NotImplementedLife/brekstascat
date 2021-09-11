INCLUDE "src/include/macros.inc"
INCLUDE "src/include/charmap.inc"

DLG_CLR0 EQU $F0
DLG_CLR1 EQU $F1
DLG_LINE EQU $F2
DLG_WKEY EQU $F3
DLG_EXEC EQU $F4
DLG_STOP EQU $FF ; debug

SECTION "DialogString_ToInfoRoom", ROMX, BANK[4]

DialogString_ToInfoRoom::
	DB "Info room", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "DialogString_ToPlayground", ROMX, BANK[4]
DialogString_ToPlayground::
	DB "Playground", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "DialogString_SacredStone", ROMX, BANK[4]
DialogString_SacredStone::
	DB "A sacred text in a forgotten&nl;language is graved here.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Pretty unreadable.", DLG_WKEY, " Oh, wait...&nl;", DLG_WKEY, "For God's sake, you're in a", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "dream! Of course you can&nl;read that.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Ahem...", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "\"Void  Eight Seven&nl;", DLG_WKEY
	DB "  Six   Five  Four&nl;", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "  Three Two   One&nl;", DLG_WKEY
	DB " And the good will happen.\"", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
DialogString_SacredStoneWrongView::
	DB "You can't read this from that side.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Dialog string Playground Instructions", ROMX, BANK[4]
DialogString_PlaygroundInstructions::
	DB "There are three halls in the&nl;top-left corner of this room.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Each of them leads to a game&nl;room where you'll have to",DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "solve a puzzle.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "For each solved puzzle you'll&nl;receive Cat coins which you'll", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "use to get access to the&nl;top-right corner room.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "You need to gain 20 Cat coins in this regard.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Now, a short tutorial...", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "There is a dummy sliding puz-&nl;zle in the center of this room.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Try to step on one of the sur-&nl;rounding arrows to see what", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "happens to the floating stones.", DLG_WKEY,"Each arrow represents the", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "corresponding D-pad key you&nl;will press in a game room to",  DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "move the pieces in the shown&nl;way.",  DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "There are three types of puz-&nl;zles: easy, medium and hard.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Your prize depends on the&nl;puzzle's complexity.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "You don't know how a solved&nl;puzzle looks like. You need", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "to figure it out for yourself.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Every solved puzzle has the&nl;empty square in the", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "bottom-right corner of the&nl;table.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Good luck!&nl;", DLG_WKEY, "- Valnyssa the Breksta's Cat", DLG_WKEY, DLG_CLR0, DLG_CLR1
	
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Dialog string High scroe message", ROM0
DialogString_HighScoreMessage::
	DB "High score table", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Highscore Table string Easy", ROM0
	
HighScore_Easy::
	DB "  Highscores  < Easy >", $F0

SECTION "Highscore Table string Medium", ROM0
	
HighScore_Medium::
	DB "Highscores  < Medium >", $F0
	
SECTION "Highscore Table string Hard", ROM0
	
HighScore_Hard::
	DB " Highscores  < Hard >", $F0
	
SECTION "Highscore Table string Master", ROM0
	
HighScore_Master::
	DB "Highscores  < Master >", $F0
	
	
SECTION "Reward strings", ROM0

RewardMessage::
	DB "You got X Cat Coins!", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Medium puzzle payment notice", ROM0;, BANK[4]

MediumPaymentNotice::
	DB "2 Cat Coins will be spent for this action.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Hard puzzle payment notice", ROM0;, BANK[4]
	
HardPaymentNotice::
	DB "4 Cat Coins will be spent for this action.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "NotEnough money notice", ROM0;, BANK[4]
NotEnoughMoneyNotice::
	DB "You don't have enough money.&nl;Go solve more sliding puzzles.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Pockets full notice", ROM0;, BANK[4]
PocketsFullNotice::
	DB "Your pockets can't hold more&nl;than 50 Cat Coins.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "You dropped the extra coins.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Snake Lines", ROM0

SnakeNot20::
	DB "Do you have 20 coins kiddo'?", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "I see... Then there's nothing to discuss with you.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn

Snake20::
	DB "Do you have 20 coins kiddo'?", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Oh! Excellent! Gim'me that&nl; and I'll let you enter in this", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Master room. ", DLG_WKEY, "My boss told me&nl;not to let anyone in there, ", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "but my wage is trash and,&nl;seriously, ", DLG_WKEY, "the hell with him!", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "I'm not his puppet!  Plus,&nl;I'm desperate. Tomorrow is", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "my wife's birthday and I didn't&nl;find a gift cheaper than 20.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "20 coins and I'll give you&nl;permanent access to the", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Master's room. ", DLG_WKEY, "20 coins and&nl;you'll never see me again.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "That's right, I have no dignity.&nl;But guess what?", DLG_WKEY, DLG_CLR0, DLG_CLR1	
	DB "I'm a snake!&nl;Snakes don't have dignity.", DLG_WKEY, DLG_CLR0, DLG_CLR1	
	DB "HAHAHAHAHAHA!!!", DLG_WKEY, DLG_CLR0, DLG_CLR1	
	DB DLG_EXEC
	DW SnakeRun
	DB "               ", DLG_CLR0, DLG_CLR1
	DB ".   .   .   .   .   .   .   .   .   .", DLG_WKEY, DLG_CLR0, DLG_CLR1	
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "Snake Run", ROM0
SnakeRun::
	ld hl, rLCDC
	res 5, [hl]	
	
	ldh a, [hMMCX]
	cp $0D
	call z, SnakeMoveRight
	ld b, $58
	call __snakeUpdate
	
	call waitForVBlank
	initOAM ShadowOAM
	ld e, 80
	.loop
	ld hl, ShadowOAM+$10
	REPT(4)
	inc [hl]
	inc [hl]
	inc l
	inc l
	inc l
	inc l
	ENDR
	call waitForVBlank
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	
	ld hl, rLCDC
	set 5, [hl]	
	call waitForVBlank
	call waitForVBlank
	
	ld a, 1
	ld [sSnakeCleared], a
	ld [wSnakeCleared], a
	ld a, [sCatCoins]
	sub $20
	ld [sCatCoins], a

SnakeClear::
	; remove snake
	xor a
	ld [wMnpcCount], a ; snake is the only npc on that map,
	; so clear all NPCs is the simplest solution
	
	; free the tile occupied by the snake
	ld [wMapMetadata + 16*2 + 13], a	
	
	ret
	
SECTION "Snake Move right", ROM0
SnakeMoveRight::
	; set snake right
	ld b, $5C
	call __snakeUpdate
	
	call waitForVBlank
	initOAM ShadowOAM
	
	ld e, 16
.loop
	ld hl, ShadowOAM+$11
	REPT(4)
	inc [hl]
	inc l
	inc l
	inc l
	inc l
	ENDR
	call waitForVBlank
	initOAM ShadowOAM
	dec e
	jr nz, .loop
	ret

; a character that explains things
; when speaking to her, she picks one random line
; from below and tells it to the player 
SECTION "P_Lines Addresses", ROMX, BANK[4]

P_StrAddresses::
	DW P_Str0, P_Str1, P_Str2, P_Str3, P_Str4, P_Str5, P_Str6, P_Str7, P_Str8

SECTION "P_Lines 0", ROM0
P_Str0::
	DB "So you were also chosen by&nl;Valnyssa to save this crappy", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "world? I failed... and now&nl;I'm just stuck here.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "My sister must be worried.&nl;I want to get out of here!", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
SECTION "P_Lines 1", ROM0
P_Str1::
	DB "You can enter the easy room&nl;for free. However, you must", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "pay for playing at other&nl;difficulties.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "I accidentally left the room&nl;during a hard puzzle, and I", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "lost my precious 5 Cat Coins&nl;I worked so hard for...", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Don't press B during a puzzle&nl;unless you are sure you want", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "to give up.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 2", ROM0
P_Str2::
	DB "There's a terrifying snake&nl;guarding the Master room.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "I'm so scared...", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 3", ROMX, BANK[4]
P_Str3::
	DB "Species reveal:&nl;", DLG_WKEY,"I'm a human!!!", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 4", ROM0
P_Str4::
	DB "You can check the highscore&nl;table in this room to see", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "your time record for each&nl;sliding puzzle.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 5", ROM0
P_Str5::
	DB "2+2=5. It's not a mistake,&nl;it's called a synergy.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 6", ROM0
P_Str6::
	DB "Why do I always stay in this&nl;corner, you ask?", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Because I feel like in a prison.&nl;I don't know how long it is since", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "I arrived here, but being&nl; awake feels like a vague,", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "distant memory.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 7", ROM0
P_Str7::
	DB "This is without doubt a dream,&nl;but for some reason the", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "experience feels too real.", DLG_WKEY, " Am&nl;I having a lucid dream?", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
SECTION "P_Lines 8", ROM0
P_Str8::
	DB "I hope you know the Greek&nl;alphabet.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	

SECTION "Level Dialog", ROMX, BANK[5]
LeverDialog::
	DB "Pulling this lever causes the&nl;reset of the game.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB "Do you really want to reset?", DLG_WKEY, "             Yes              No"
	DB DLG_EXEC
	DW LeverResetChoose
	DB DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
