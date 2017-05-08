#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
import math

gcc = input('gcc')
illegal_func = input('illegal_func')
illegal_header = input('illegal_header')
missing = input('missing')
m_error = input('m_error')
check = input('check')
I_refs = input('I_refs')
cpu_time = input('cpu_time')
m_peak = input('m_peak')
flt = input('flt')
maxrss = input('maxrss')


def maxx(a, b):
    if(a > b):
        return a
    else:
        return b

if (gcc | illegal_func | illegal_header | missing):
    priority = 0
    func = 0
else:
    func = check * (0.95**m_error)
    if (check == 1):
        perf_I1 = math.log(2+1057085137)/math.log(2+I_refs)
        perf_I2 = math.log(2+290000)/math.log(2+cpu_time)
        if perf_I1 > 0:
            perf_I = perf_I1
        else:
            perf_I2
        priority = perf_I * maxx(math.log(2+72937472)/math.log(2+m_peak), math.log(2+2638*10416128)/math.log(2+flt*maxrss))
    else:
        priority = 0
