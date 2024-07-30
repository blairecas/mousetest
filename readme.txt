Utilities for various addons for Elektronika MS-0511 (UKNC)

1) Mouse prototype test 
Register on PPU: 177400 [YYYYYYYBXXXXXXXB]
Y, X - signed 7-bit

2) AY test and .pt3 player (PPT3)
Registers on PPU: 177360-177364 (3 AY)
mov regN, @#177360
movb regData, @#177360

3) AY and covox on PPU LPT port (PT3LPT, COVOX, SSTINT)

4) primitive MIDI player (PMIDI)
Registers on PPU: 177366 (control), 177400 (midi data send)

.. and Duke Nukem with midi intro music
.. Hail to the king, baby!
