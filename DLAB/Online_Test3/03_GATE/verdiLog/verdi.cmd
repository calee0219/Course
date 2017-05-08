wvResizeWindow -win $_nWave1 54 237 960 332
wvOpenFile -win $_nWave1 \
           {/users/DLAB/2016dlabtest22/OT11_27/03_GATE/OT11_27_SYN.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvResizeWindow -win $_nWave1 -4 0 1920 1018
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/bomb[7:0]} \
{/TESTBED/clk} \
{/TESTBED/hit[5:0]} \
{/TESTBED/in[7:0]} \
{/TESTBED/in_valid1} \
{/TESTBED/in_valid2} \
{/TESTBED/out[6:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/bomb[7:0]} \
{/TESTBED/clk} \
{/TESTBED/hit[5:0]} \
{/TESTBED/in[7:0]} \
{/TESTBED/in_valid1} \
{/TESTBED/in_valid2} \
{/TESTBED/out[6:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvExit
