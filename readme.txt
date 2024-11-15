Utilities for various addons for Elektronika MS-0511 (UKNC)
files are in ./release/ folder

1) MOUTST.SAV, MOUSE.SAV
mouse prototype test 
register on PPU: 177400 [YYYYYYYBXXXXXXXB]
Y, X - signed 7-bit

2) PPSG.SAV, PPT3.SAV, PT3LPT.SAV
.psg and .pt3 players
registers on PPU: 177360-177364 (3 AY)
mov regN, @#177360
movb regData, @#177360

3) COVOX.SAV, SSTINT.SAV, TSTLPT.SAV
covox on PPU LPT port A demos

4) PMIDI.SAV
primitive MIDI player
registers on PPU: 177366 (control), 177400 (midi data send)

X) DUKE.SAV
.. and Duke Nukem with midi intro music
.. Hail to the king, baby!
