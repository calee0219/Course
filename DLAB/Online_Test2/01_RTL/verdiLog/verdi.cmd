wvResizeWindow -win $_nWave1 54 237 960 332
wvResizeWindow -win $_nWave1 -4 0 1920 1018
wvOpenFile -win $_nWave1 \
           {/users/DLAB/2016dlabtest22/Online_Test2/01_RTL/Online_test2.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/out[35:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_PATTERN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_Online_test2"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/out[35:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/U_Online_test2/a0[15:0]} \
{/TESTBED/U_Online_test2/b0[15:0]} \
{/TESTBED/U_Online_test2/m00I[17:0]} \
{/TESTBED/U_Online_test2/m00R[17:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 )}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_Online_test2"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/out[35:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/U_Online_test2/a0[15:0]} \
{/TESTBED/U_Online_test2/b0[15:0]} \
{/TESTBED/U_Online_test2/m00I[17:0]} \
{/TESTBED/U_Online_test2/m00R[17:0]} \
{/TESTBED/U_Online_test2/a1[15:0]} \
{/TESTBED/U_Online_test2/b1[15:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 )}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[15:0]} \
{/TESTBED/in_mode} \
{/TESTBED/in_valid} \
{/TESTBED/out[35:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/U_Online_test2/a0[15:0]} \
{/TESTBED/U_Online_test2/b0[15:0]} \
{/TESTBED/U_Online_test2/m00I[17:0]} \
{/TESTBED/U_Online_test2/m00R[17:0]} \
{/TESTBED/U_Online_test2/a1[15:0]} \
{/TESTBED/U_Online_test2/b1[15:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 )}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 )}
wvSelectSignal -win $_nWave1 {( "G1" 12 )}
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 )}
wvSelectSignal -win $_nWave1 {( "G1" 11 )}
wvSelectSignal -win $_nWave1 {( "G1" 12 )}
wvSelectSignal -win $_nWave1 {( "G1" 10 )}
wvSetCursor -win $_nWave1 2722.158107 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 2548.528563 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2566.185805 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 2610.328909 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 2245.412579 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2227.755338 -snap {("G1" 6)}
