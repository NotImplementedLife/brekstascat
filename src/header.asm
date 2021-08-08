INCLUDE "src/include/macros.inc"

rBGPI EQU $FF68
rOBPI EQU $FF6A

SECTION "Header", ROM0[$100]
	nop
	jp EntryPoint
	
	DS $150 - @, 0

SECTION "Entry point", ROM0

EntryPoint:		
	call HbOwlSplashScreen
	call CopyDMARoutine
	
	ei
	vBlankInit	
			
	jp Start




