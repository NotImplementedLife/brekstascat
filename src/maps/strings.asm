INCLUDE "src/include/charmap.inc"

DLG_CLR0 EQU $F0
DLG_CLR1 EQU $F1
DLG_LINE EQU $F2
DLG_WKEY EQU $F3
DLG_EXEC EQU $F4
DLG_STOP EQU $FF ; debug

SECTION "Sign Strings", ROMX, BANK[4]

DialogString_ToInfoRoom::
	DB "Info room", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
DialogString_ToPlayground::
	DB "Playground", DLG_WKEY, DLG_CLR0, DLG_CLR1
	DB DLG_EXEC
	DW Tilemap_DialogReturn
	
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
	
	;DB "Try to step on the arrows.", DLG_WKEY, DLG_CLR0, DLG_CLR1
	;DB "", DLG_WKEY, DLG_CLR0, DLG_CLR1
	
	DB DLG_EXEC
	DW Tilemap_DialogReturn