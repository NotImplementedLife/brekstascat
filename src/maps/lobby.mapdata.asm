INCLUDE "src/include/constants.inc"

SECTION "Lobby Map data", ROMX, BANK[4]

MAP_Lobby::

; size : 1024
.tilemap::

DB $06, $14, $06, $00, $12, $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $04, $14, $01, $07, $14, $07
DB $16, $14, $16, $10, $12, $12, $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $04, $14, $14, $11, $17, $14, $17
DB $23, $24, $23, $20, $12, $12, $12, $05, $06, $07, $06, $07, $06, $07, $08, $07, $06, $05, $06, $07, $06, $07, $06, $07, $08, $14, $14, $14, $21, $23, $24, $23
DB $06, $14, $06, $00, $12, $12, $12, $15, $16, $17, $16, $17, $16, $17, $18, $17, $16, $15, $16, $17, $16, $17, $16, $17, $18, $14, $14, $14, $01, $07, $14, $07
DB $16, $14, $16, $10, $12, $12, $12, $25, $26, $27, $26, $27, $26, $27, $28, $27, $26, $25, $26, $27, $26, $27, $26, $27, $28, $14, $14, $14, $11, $17, $14, $17
DB $23, $24, $23, $20, $12, $12, $12, $35, $36, $07, $06, $07, $06, $37, $48, $07, $06, $45, $36, $07, $06, $07, $06, $37, $38, $14, $14, $14, $21, $23, $24, $23
DB $06, $14, $06, $00, $12, $12, $12, $35, $46, $17, $16, $17, $16, $47, $58, $42, $43, $55, $46, $17, $16, $17, $16, $47, $38, $14, $14, $14, $01, $07, $14, $07
DB $16, $14, $16, $10, $12, $12, $12, $35, $56, $27, $26, $27, $26, $57, $68, $52, $53, $65, $56, $27, $26, $27, $26, $57, $38, $14, $14, $14, $11, $17, $14, $17
DB $23, $24, $23, $20, $12, $12, $12, $35, $38, $60, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $61, $35, $38, $14, $14, $14, $21, $23, $24, $23
DB $06, $14, $06, $00, $12, $12, $12, $35, $38, $14, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $12, $35, $38, $14, $14, $14, $01, $07, $14, $07
DB $16, $14, $16, $10, $12, $12, $12, $35, $38, $14, $13, $13, $13, $13, $14, $13, $13, $12, $13, $13, $13, $13, $12, $35, $38, $14, $14, $14, $11, $17, $14, $17
DB $23, $24, $23, $20, $12, $12, $12, $35, $38, $14, $13, $13, $13, $60, $23, $23, $23, $23, $61, $13, $13, $13, $12, $35, $38, $14, $14, $14, $21, $23, $24, $23
DB $06, $14, $06, $00, $12, $12, $12, $35, $38, $14, $13, $13, $13, $13, $23, $24, $22, $23, $13, $13, $13, $13, $12, $35, $38, $14, $14, $14, $01, $07, $14, $07
DB $16, $14, $16, $10, $12, $12, $12, $35, $38, $14, $13, $23, $23, $23, $13, $60, $61, $13, $23, $23, $23, $13, $12, $35, $38, $14, $14, $14, $11, $17, $14, $17
DB $23, $23, $23, $23, $12, $12, $12, $35, $38, $14, $13, $03, $03, $03, $13, $70, $71, $13, $03, $03, $03, $13, $12, $35, $38, $14, $14, $14, $23, $23, $23, $23
DB $23, $23, $61, $03, $71, $12, $12, $35, $38, $14, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $12, $35, $38, $14, $14, $70, $03, $60, $23, $23
DB $03, $03, $03, $03, $03, $71, $12, $35, $38, $14, $13, $13, $13, $70, $03, $03, $03, $03, $71, $13, $13, $13, $12, $35, $38, $14, $70, $03, $03, $03, $03, $03
DB $13, $13, $13, $13, $13, $13, $12, $35, $38, $14, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $12, $35, $38, $14, $13, $13, $13, $13, $13, $13
DB $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $61, $14, $13, $13, $13, $13, $13, $13, $13, $13, $12, $60, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23
DB $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $71, $14, $13, $13, $13, $60, $61, $13, $13, $13, $12, $70, $03, $03, $03, $03, $03, $03, $03, $03, $03, $04
DB $12, $66, $72, $73, $72, $73, $72, $73, $72, $73, $72, $14, $02, $04, $13, $14, $12, $13, $13, $13, $12, $73, $72, $73, $72, $73, $72, $73, $72, $73, $67, $14
DB $12, $15, $16, $17, $16, $17, $16, $17, $16, $17, $16, $14, $22, $24, $13, $14, $12, $13, $13, $13, $12, $17, $16, $17, $16, $17, $16, $17, $16, $17, $18, $14
DB $12, $25, $26, $27, $26, $27, $26, $27, $26, $27, $27, $14, $13, $13, $13, $14, $12, $13, $13, $13, $12, $27, $26, $27, $26, $27, $26, $27, $26, $27, $28, $14
DB $12, $35, $36, $07, $06, $07, $06, $07, $06, $07, $06, $14, $13, $13, $13, $14, $12, $02, $04, $13, $12, $07, $06, $07, $06, $07, $06, $07, $06, $37, $38, $14
DB $12, $35, $46, $17, $16, $42, $43, $17, $16, $17, $16, $14, $13, $13, $13, $14, $12, $22, $24, $13, $12, $17, $16, $17, $16, $42, $43, $17, $16, $47, $38, $14
DB $12, $35, $56, $27, $26, $52, $53, $27, $26, $27, $26, $14, $13, $13, $13, $14, $12, $13, $13, $13, $12, $27, $26, $27, $26, $52, $53, $27, $26, $57, $38, $14
DB $12, $35, $38, $23, $23, $23, $23, $23, $23, $23, $23, $24, $13, $13, $13, $14, $12, $13, $13, $13, $22, $23, $23, $23, $23, $23, $23, $23, $23, $35, $38, $14
DB $12, $35, $38, $13, $60, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $24, $22, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $61, $13, $35, $38, $14
DB $12, $35, $38, $13, $70, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $71, $13, $35, $38, $14
DB $12, $35, $38, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $35, $38, $14
DB $22, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $24
DB $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13, $13

.meta::

DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00001_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01,
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, %00000_0_0_0, %00000_0_0_1, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_0, %00000_0_0_1, $01, 
DB %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, %00000_0_0_1, $01, 

.exitPointsCount::

DB $02

.exitPoints::

DB $C2, iMAP_InfoRoom, $B7, $01
;DB $C2, $00, $B7, $00
DB $CC, $00, $37, $00

.mActions::
DW _mAction_NoOp
DW _mAction_Lobby_GoDown37
REPT(30)
DW _mAction_NoOp
ENDR
	