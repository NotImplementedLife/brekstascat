SECTION "Precomputed sin values for BG96", ROMX, BANK[2], ALIGN[4]

PSin::
	DB 48+0, 48+1, 48+3, 48+4, 48+7, 48+4, 48+3, 48+1, 48+0, 48-1, 48-3, 48-4, 48-7, 48-4, 48-3, 48-1

SECTION "PSin Indexes for lines 0-95", WRAM0
	
LSin::
	DS 96

