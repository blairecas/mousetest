<?php

    $zero = 0x80;
    $amp = 0x7F;
    $frame = 256;
    $dt = 2*M_PI/$frame;

    $g = fopen("sine.txt", "wb");
    fputs($g, "SineTable:\n");
    for ($i=0,$n=0,$t=0; $i<$frame; $i++,$n++,$t+=$dt)
    {
	$val = $zero + $amp*sin($t);
        if ($n == 0) fputs($g, "\t.byte\t");
        fputs($g, decoct(intval($val)));
        if ($n < 7) fputs($g, ", "); else { fputs($g, "\n"); $n=-1; }
    }
    fclose($g);
?>