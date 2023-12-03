<?php

function getbyte ($f)
{
    $s = fread($f, 1);
    if (strlen($s) == 0) return 0;
    return ord($s[0]);
}

function getFF ($f)
{
    // only 14 registers are used
    $regs = Array(0=>0, 1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>0, 11=>0, 12=>0, 13=>0);
    for ($i=0; $i<16; $i++) 
    {
        if (feof($f)) return $regs;
        $r = getbyte($f); if ($r == 0xFF) { fseek($f, -1, SEEK_CUR); return $regs; }
        $b = getbyte($f); $regs[$r] = $b;
    }
    return $regs;
}

    /////////////////////////////////////////////////

    $f = fopen("super_mario_log.psg", "rb");

    fread($f, 16);          // skip header
    $skip_spaces = true;    // skip initial FE spaces

    $out = Array();

    $frame = 0;
    while (!feof($f)) 
    {
        $b = getbyte($f);
        // spaces in frames
        if ($b == 0xFE) {
            if ($skip_spaces) {
                fread($f, 1);
                $skip_spaces = false;
                continue;
            } else {
                echo 'FE encountered in PSG dump! Not supported for now!';
                exit(1);
            }
        }
        // FF is registers (or another FF)
        if ($b == 0xFF) {
            $regs = getFF($f);
            $out[$frame++] = $regs;
            continue;
        }
        echo "WTF? at frame $frame and with 0x".dechex($b);
        exit(1);
    }

    fclose ($f);

    // output
    $g = fopen("super_mario_log.txt", "wb");
    fputs($g, "MarioPsg:\n");
    for ($i=0; $i<$frame; $i++)
    {
        fputs($g, "\t.byte\t");
        $regs = $out[$i];
        for ($j=0; $j<14; $j++) {
            fputs($g, decoct($regs[$j]));
            if ($j<13) fputs($g, ", ");
        }
        fputs($g, "\n");
    }
    fclose($g);
?>