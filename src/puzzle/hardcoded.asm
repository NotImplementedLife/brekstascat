; hardcoded data for pieces manipulation
; move them to ROM0 to save up some space in BANK 4
	
SECTION "Sliding puzzle renderer piece position", ROM0

PuzzleRendererPiecePos3::	
DW $9884, $9888, $988C, 
DW $9904, $9908, $990C, 
DW $9984, $9988, $998C

PuzzleRendererPiecePos4::	
DW $9884, $9887, $988A, $988D
DW $98E4, $98E7, $98EA, $98ED
DW $9944, $9947, $994A, $994D
DW $99A4, $99A7, $99AA, $99AD

PuzzleRendererPiecePos5::	
DW $98A5, $98A7, $98A9, $98AB, $98AD
DW $98E5, $98E7, $98E9, $98EB, $98ED
DW $9925, $9927, $9929, $992B, $992D
DW $9965, $9967, $9969, $996B, $996D
DW $99A5, $99A7, $99A9, $99AB, $99AD

PuzzleRendererPiecePos6::
DW $9884, $9886, $9888, $988A, $988C, $988E
DW $98C4, $98C6, $98C8, $98CA, $98CC, $98CE
DW $9904, $9906, $9908, $990A, $990C, $990E
DW $9944, $9946, $9948, $994A, $994C, $994E
DW $9984, $9986, $9988, $998A, $998C, $998E
DW $99C4, $99C6, $99C8, $99CA, $99CC, $99CE

SECTION "Sliding puzzle renderer piece tiles", ROM0

PuzzleRendererPieceTiles3::
	
DB $00+$00, $00+$01, $00+$02, $00+$03, $00+$0C, $00+$0D, $00+$0E, $00+$0F, $00+$18, $00+$19, $00+$1A, $00+$1B, $00+$24, $00+$25, $00+$26, $00+$27
DB $00+$04, $00+$05, $00+$06, $00+$07, $00+$10, $00+$11, $00+$12, $00+$13, $00+$1C, $00+$1D, $00+$1E, $00+$1F, $00+$28, $00+$29, $00+$2A, $00+$2B
DB $00+$08, $00+$09, $00+$0A, $00+$0B, $00+$14, $00+$15, $00+$16, $00+$17, $00+$20, $00+$21, $00+$22, $00+$23, $00+$2C, $00+$2D, $00+$2E, $00+$2F

DB $30+$00, $30+$01, $30+$02, $30+$03, $30+$0C, $30+$0D, $30+$0E, $30+$0F, $30+$18, $30+$19, $30+$1A, $30+$1B, $30+$24, $30+$25, $30+$26, $30+$27
DB $30+$04, $30+$05, $30+$06, $30+$07, $30+$10, $30+$11, $30+$12, $30+$13, $30+$1C, $30+$1D, $30+$1E, $30+$1F, $30+$28, $30+$29, $30+$2A, $30+$2B
DB $30+$08, $30+$09, $30+$0A, $30+$0B, $30+$14, $30+$15, $30+$16, $30+$17, $30+$20, $30+$21, $30+$22, $30+$23, $30+$2C, $30+$2D, $30+$2E, $30+$2F

DB $60+$00, $60+$01, $60+$02, $60+$03, $60+$0C, $60+$0D, $60+$0E, $60+$0F, $60+$18, $60+$19, $60+$1A, $60+$1B, $60+$24, $60+$25, $60+$26, $60+$27
DB $60+$04, $60+$05, $60+$06, $60+$07, $60+$10, $60+$11, $60+$12, $60+$13, $60+$1C, $60+$1D, $60+$1E, $60+$1F, $60+$28, $60+$29, $60+$2A, $60+$2B
DB $60+$08, $60+$09, $60+$0A, $60+$0B, $60+$14, $60+$15, $60+$16, $60+$17, $60+$20, $60+$21, $60+$22, $60+$23, $60+$2C, $60+$2D, $60+$2E, $60+$2F

PuzzleRendererPieceTiles4::

DB $00+$00, $00+$01, $00+$02, $00+$0C, $00+$0D, $00+$0E, $00+$18, $00+$19, $00+$1A
DB $00+$03, $00+$04, $00+$05, $00+$0F, $00+$10, $00+$11, $00+$1B, $00+$1C, $00+$1D
DB $00+$06, $00+$07, $00+$08, $00+$12, $00+$13, $00+$14, $00+$1E, $00+$1F, $00+$20
DB $00+$09, $00+$0A, $00+$0B, $00+$15, $00+$16, $00+$17, $00+$21, $00+$22, $00+$23

DB $24+$00, $24+$01, $24+$02, $24+$0C, $24+$0D, $24+$0E, $24+$18, $24+$19, $24+$1A
DB $24+$03, $24+$04, $24+$05, $24+$0F, $24+$10, $24+$11, $24+$1B, $24+$1C, $24+$1D
DB $24+$06, $24+$07, $24+$08, $24+$12, $24+$13, $24+$14, $24+$1E, $24+$1F, $24+$20
DB $24+$09, $24+$0A, $24+$0B, $24+$15, $24+$16, $24+$17, $24+$21, $24+$22, $24+$23

DB $48+$00, $48+$01, $48+$02, $48+$0C, $48+$0D, $48+$0E, $48+$18, $48+$19, $48+$1A
DB $48+$03, $48+$04, $48+$05, $48+$0F, $48+$10, $48+$11, $48+$1B, $48+$1C, $48+$1D
DB $48+$06, $48+$07, $48+$08, $48+$12, $48+$13, $48+$14, $48+$1E, $48+$1F, $48+$20
DB $48+$09, $48+$0A, $48+$0B, $48+$15, $48+$16, $48+$17, $48+$21, $48+$22, $48+$23

DB $6C+$00, $6C+$01, $6C+$02, $6C+$0C, $6C+$0D, $6C+$0E, $6C+$18, $6C+$19, $6C+$1A
DB $6C+$03, $6C+$04, $6C+$05, $6C+$0F, $6C+$10, $6C+$11, $6C+$1B, $6C+$1C, $6C+$1D
DB $6C+$06, $6C+$07, $6C+$08, $6C+$12, $6C+$13, $6C+$14, $6C+$1E, $6C+$1F, $6C+$20
DB $6C+$09, $6C+$0A, $6C+$0B, $6C+$15, $6C+$16, $6C+$17, $6C+$21, $6C+$22, $6C+$23

PuzzleRendererPieceTiles5::

DB $00+$00, $00+$01, $00+$0A, $00+$0B
DB $00+$02, $00+$03, $00+$0C, $00+$0D
DB $00+$04, $00+$05, $00+$0E, $00+$0F
DB $00+$06, $00+$07, $00+$10, $00+$11
DB $00+$08, $00+$09, $00+$12, $00+$13

DB $14+$00, $14+$01, $14+$0A, $14+$0B
DB $14+$02, $14+$03, $14+$0C, $14+$0D
DB $14+$04, $14+$05, $14+$0E, $14+$0F
DB $14+$06, $14+$07, $14+$10, $14+$11
DB $14+$08, $14+$09, $14+$12, $14+$13

DB $28+$00, $28+$01, $28+$0A, $28+$0B
DB $28+$02, $28+$03, $28+$0C, $28+$0D
DB $28+$04, $28+$05, $28+$0E, $28+$0F
DB $28+$06, $28+$07, $28+$10, $28+$11
DB $28+$08, $28+$09, $28+$12, $28+$13

DB $3C+$00, $3C+$01, $3C+$0A, $3C+$0B
DB $3C+$02, $3C+$03, $3C+$0C, $3C+$0D
DB $3C+$04, $3C+$05, $3C+$0E, $3C+$0F
DB $3C+$06, $3C+$07, $3C+$10, $3C+$11
DB $3C+$08, $3C+$09, $3C+$12, $3C+$13

DB $50+$00, $50+$01, $50+$0A, $50+$0B
DB $50+$02, $50+$03, $50+$0C, $50+$0D
DB $50+$04, $50+$05, $50+$0E, $50+$0F
DB $50+$06, $50+$07, $50+$10, $50+$11
DB $50+$08, $50+$09, $50+$12, $50+$13

PuzzleRendererPieceTiles6::

DB $00+$00, $00+$01, $00+$0C, $00+$0D
DB $00+$02, $00+$03, $00+$0E, $00+$0F
DB $00+$04, $00+$05, $00+$10, $00+$11
DB $00+$06, $00+$07, $00+$12, $00+$13
DB $00+$08, $00+$09, $00+$14, $00+$15
DB $00+$0A, $00+$0B, $00+$16, $00+$17

DB $18+$00, $18+$01, $18+$0C, $18+$0D
DB $18+$02, $18+$03, $18+$0E, $18+$0F
DB $18+$04, $18+$05, $18+$10, $18+$11
DB $18+$06, $18+$07, $18+$12, $18+$13
DB $18+$08, $18+$09, $18+$14, $18+$15
DB $18+$0A, $18+$0B, $18+$16, $18+$17

DB $30+$00, $30+$01, $30+$0C, $30+$0D
DB $30+$02, $30+$03, $30+$0E, $30+$0F
DB $30+$04, $30+$05, $30+$10, $30+$11
DB $30+$06, $30+$07, $30+$12, $30+$13
DB $30+$08, $30+$09, $30+$14, $30+$15
DB $30+$0A, $30+$0B, $30+$16, $30+$17

DB $48+$00, $48+$01, $48+$0C, $48+$0D
DB $48+$02, $48+$03, $48+$0E, $48+$0F
DB $48+$04, $48+$05, $48+$10, $48+$11
DB $48+$06, $48+$07, $48+$12, $48+$13
DB $48+$08, $48+$09, $48+$14, $48+$15
DB $48+$0A, $48+$0B, $48+$16, $48+$17

DB $60+$00, $60+$01, $60+$0C, $60+$0D
DB $60+$02, $60+$03, $60+$0E, $60+$0F
DB $60+$04, $60+$05, $60+$10, $60+$11
DB $60+$06, $60+$07, $60+$12, $60+$13
DB $60+$08, $60+$09, $60+$14, $60+$15
DB $60+$0A, $60+$0B, $60+$16, $60+$17

DB $78+$00, $78+$01, $78+$0C, $78+$0D
DB $78+$02, $78+$03, $78+$0E, $78+$0F
DB $78+$04, $78+$05, $78+$10, $78+$11
DB $78+$06, $78+$07, $78+$12, $78+$13
DB $78+$08, $78+$09, $78+$14, $78+$15
DB $78+$0A, $78+$0B, $78+$16, $78+$17


