UPPER_BASE EQU $90

UCHARS equs "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
UCHAR = 0
REPT STRLEN("{UCHARS}")
	charmap STRSUB("{UCHARS}", UCHAR + 1, 1), UPPER_BASE + UCHAR
UCHAR = UCHAR + 1
ENDR

LOWER_BASE EQU $AA

LCHARS equs "abcdefghijklmnopqrs"
LCHAR = 0
REPT STRLEN("{LCHARS}")
	charmap STRSUB("{LCHARS}", LCHAR + 1, 1), LOWER_BASE + LCHAR
LCHAR = LCHAR + 1
ENDR

charmap "t", $F4
charmap "u", $F5
charmap "v", $F6
charmap "w", $F7
charmap "x", $F8
charmap "y", $F9
charmap "z", $FA

charmap " ", $FF
