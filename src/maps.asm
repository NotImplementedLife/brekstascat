; a little scrollmap engine
; map size is 16x16 and cosists of 256 2x2 metatiles

INCLUDE "src/include/macros.inc"

SECTION "Scroll map Metadata", WRAM0, ALIGN[8]

; wMapMetadata
; byte at offset 16*y+x tells the following about the position (x,y)
; bit 0 : 0 = barrier, 1 = can walk on
; bit 1 : 0 = free, 1 = occupied by an NPC
; bit 2 : not used
; bits 3-7 : last 5 bits of an address pointing to an action to be executed on A button press (wMActions)
wMapMetadata:: 
	DS 16*16
	
SECTION "Scroll map MapActions", WRAM0, ALIGN[6]

wMActions::
	DS 64 ; 32 MActions * 2 bytes per address

SECTION "Scroll map NPCs", WRAM0, ALIGN[8]

wMnpcCount::
	DS 1
; NPC Data
; For each NPC:
;  bytes 0-3 : Orientation:Front tiles
;  bytes 4-7 : Orientation:Back tiles
;  bytes 8-11 : Orientation:Lateral tiles (Left; Obtain right by tile mirroring)
;  byte 12 : PosY
;  byte 13 : PosX
;  byte 14 : Orientation (0=Front, 1=Back, 2=Left, 3=Right)
;  byte 15 : 0 = Static, 1 = Dynamic (adjustes orientation to player's position)
wMnpcData::
	DS 16*8 ; (Though I doubt I'll need 8 NPCs in this game)
	

SECTION "Scroll map Main Character", HRAM

hMCY::
	DS 1
hMCX::
	DS 1

; Now let's write some code

SECTION "Scroll map loader", ROM0



