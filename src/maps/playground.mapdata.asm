INCLUDE "src/include/constants.inc"

SECTION "Playground map data", ROMX, BANK[4]

MAP_Playground::

; size : 1024
.tilemap::

DB $f0, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $83, $f1
DB $85, $86, $87, $db, $dc, $86, $87, $dd, $de, $86, $87, $eb, $ec, $86, $87, $86, $87, $86, $87, $86, $87, $86, $87, $86, $87, $86, $87, $86, $87, $86, $87, $88
DB $95, $96, $97, $c0, $c1, $96, $97, $c0, $c1, $96, $97, $c0, $c1, $96, $97, $96, $97, $96, $97, $96, $97, $96, $97, $96, $97, $96, $97, $c0, $c1, $96, $97, $98
DB $a5, $a6, $a7, $d0, $d1, $a6, $a7, $d0, $d1, $a6, $a7, $d0, $d1, $a6, $a7, $a6, $a7, $a6, $a7, $a6, $a7, $a6, $a7, $a6, $a7, $a6, $a7, $d0, $d1, $a6, $a7, $a8
DB $b5, $e0, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $e1, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $e0, $e1, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $e0, $e1, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $f0, $f1, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $f0, $f1, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $81, $80, $93, $93, $93, $93, $93, $93, $93, $93, $ed, $ee, $94, $93, $93, $93, $93, $93, $93, $93, $81, $80, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $91, $90, $93, $93, $93, $93, $93, $93, $93, $93, $fd, $fe, $94, $93, $93, $93, $93, $93, $93, $93, $91, $90, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $82, $a1, $a0, $93, $93, $93, $93, $93, $93, $93, $93, $a3, $a3, $a4, $93, $93, $93, $93, $93, $93, $82, $a1, $a0, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $92, $81, $80, $93, $93, $93, $93, $93, $89, $8b, $8b, $8b, $8b, $8b, $8b, $8a, $93, $93, $93, $93, $92, $81, $80, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $a2, $a3, $a3, $93, $93, $93, $93, $93, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $93, $93, $93, $a2, $a3, $a3, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $ef, $cf, $94, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $8f, $af, $94, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $ff, $df, $94, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $9f, $bf, $94, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $a3, $a3, $a4, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $a3, $a3, $a4, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $9c, $b4, $b4, $b4, $b4, $b4, $b4, $9b, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $e0, $e1, $93, $93, $93, $93, $93, $99, $8c, $8c, $8c, $8c, $8c, $8c, $9a, $93, $93, $93, $93, $93, $e0, $e1, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $f0, $f1, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $f0, $f1, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $a1, $a0, $93, $93, $93, $93, $93, $93, $93, $93, $8d, $8e, $94, $93, $93, $93, $93, $93, $93, $93, $a1, $a0, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $81, $80, $93, $93, $93, $93, $93, $93, $93, $93, $9d, $9e, $94, $93, $93, $93, $93, $93, $93, $93, $81, $80, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $82, $91, $90, $93, $93, $93, $93, $93, $93, $93, $93, $a3, $a3, $a4, $93, $93, $93, $93, $93, $93, $82, $b0, $b1, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $92, $a1, $a0, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $a1, $a0, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $a2, $a3, $a3, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $d9, $da, $93, $93, $93, $a2, $a3, $a3, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $e9, $ea, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $b5, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $b8
DB $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $e1, $93, $93, $e0, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3, $a3
DB $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $92, $93, $93, $94, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93, $93

.meta::

DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %01011_0_0_0, %00000_0_0_1, %01100_0_0_0, %00000_0_0_1, %01101_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %10001_0_0_0, %00000_0_0_1, $01, 

DB %00000_0_0_0, %01110_0_0_0, %00000_0_0_0, %01111_0_0_0, %00000_0_0_0, %10000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 

DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00010_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00010_0_0_0, %00001_0_0_0, %00010_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00010_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, $01, 

DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00110_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %01000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00110_0_0_0, %00101_0_0_0, %00110_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %01000_0_0_0, %00111_0_0_0, %01000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00110_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %01000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 


DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00100_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00100_0_0_0, %00011_0_0_0, %00100_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00100_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %01010_1_0_1, %00000_0_0_0, %00000_0_0_0, $01, 

DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %01001_1_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 



.exitPointsCount::

DB $01

.exitPoints::

DB $F7, $00, $DC, $00

.mActions::
DW _mAction_NoOp            ; 00000
DW arrEventDownStepOn       ; 00001
DW arrEventDownStepOut      ; 00010
DW arrEventUpStepOn         ; 00011
DW arrEventUpStepOut        ; 00100
DW arrEventRightStepOn      ; 00101
DW arrEventRightStepOut     ; 00110
DW arrEventLeftStepOn       ; 00111
DW arrEventLeftStepOut      ; 01000
DW _mAction_Playground_SacredStone_Dialog ; 01001
DW _mAction_Playground_Sign_Instructions  ; 01010
DW _mAction_EnterPuzzleRoomE              ; 01011
DW _mAction_EnterPuzzleRoomM              ; 01100
DW _mAction_EnterPuzzleRoomH              ; 01101
DW _mAction_ExitPuzzleRoomE               ; 01110
DW _mAction_ExitPuzzleRoomM               ; 01111
DW _mAction_ExitPuzzleRoomH               ; 10000
DW _mAction_EnterPuzzleRoomX              ; 10001
REPT(14)
DW _mAction_NoOp
ENDR


.NpcCount::

DB $00

.NPCs::




