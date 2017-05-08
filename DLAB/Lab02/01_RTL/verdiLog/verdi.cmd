wvResizeWindow -win $_nWave1 61 265 1451 748
wvResizeWindow -win $_nWave1 61 2 1451 776
wvResizeWindow -win $_nWave1 61 2 1855 1056
wvOpenFile -win $_nWave1 {/users/dlab2016/2016dlab31/Lab02/01_RTL/CONVCOR.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in_a[15:0]} \
{/TESTBED/in_b[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 362.709832 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 4115.107914 -snap {("G1" 4)}
wvZoom -win $_nWave1 4781.175060 4926.258993
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in_a[15:0]} \
{/TESTBED/in_b[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/rst_n} \
{/TESTBED/out[35:0]} \
{/TESTBED/out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10043.764988 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 9773.381295 -snap {("G1" 8)}
