SECTION "Logo Main Logic", ROMX, BANK[3]

Logo_Main::
	call clearVRAM
	call LogoBackground_InitVRAM
	jr @
	