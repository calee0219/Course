wvResizeWindow -win $_nWave1 54 237 960 332
wvOpenFile -win $_nWave1 \
           {/users/DLAB/2016dlabtest22/Online_test1/01_RTL/Online_test1.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvResizeWindow -win $_nWave1 -4 0 1920 1018
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[3:0]} \
{/TESTBED/in_valid} \
{/TESTBED/mode[1:0]} \
{/TESTBED/out[10:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_TEST"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/in[3:0]} \
{/TESTBED/in_valid} \
{/TESTBED/mode[1:0]} \
{/TESTBED/out[10:0]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/I_TEST/cstate[2:0]} \
{/TESTBED/I_TEST/mod[1:0]} \
{/TESTBED/I_TEST/nstate[2:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 )}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 294098.739608 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 294211.712255 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 294098.739608 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 293722.164119 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 294249.369804 -snap {("G1" 10)}
wvExit
