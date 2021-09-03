INCLUDE "src/include/macros.inc"

SECTION "VRAM Backup TS", WRAMX

wVBackup_Tileset::
	DS 16*128

SECTION "VRAM Backup TM", WRAMX	
wVBackup_Tilemap::
	DS 32*32
	
SECTION "VRAM Backup OAM", WRAMX		
wVBackup_OAM::
	DS 160

SECTION "VRAM Backup Procedure", ROMX, BANK[4]

TakeVRAMSnapshot::
	ld hl, wVBackup_Tileset
	ld de, $8800
	ld bc, $9000
	call loadMemoryDOUBLE
	ld hl, wVBackup_Tilemap
	ld de, $9800
	ld bc, $9C00
	call loadMemoryDOUBLE
	ld hl, wVBackup_OAM
	ld de, ShadowOAM
	ld bc, 160
	call loadMemory
	call waitForVBlank
	ldh a, [rLCDC]
	res 4, a
	ldh [rLCDC], a
	ret
	
SECTION "VRAM Restore Procedure", ROMX, BANK[4]
RestoreVRAMSnapshot::
	ld de, wVBackup_Tileset
	ld hl, $8800
	ld bc, wVBackup_Tileset+$800
	call loadMemoryDOUBLE
	ld hl, $9800
	ld de, wVBackup_Tilemap
	ld bc, wVBackup_Tilemap+$400
	call loadMemoryDOUBLE
	ld hl, ShadowOAM
	ld de, wVBackup_OAM
	ld bc, 160
	call loadMemory
	call waitForVBlank
	initOAM ShadowOAM
	ldh a, [rLCDC]
	set 4, a
	ldh [rLCDC], a
	ret
