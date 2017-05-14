#!/usr/bin/env python3

import pandas as pd
import numpy as np
import re
from datetime import datetime

data = pd.read_csv('./ML_data.csv',)
test = pd.read_csv('./ML_test.csv',)

target = []


def Classify():
    fattr = open('./ML_assignment_3_attr.txt', 'r')
    classify = re.compile('(^\ --*)|(^--*)')
    cando = re.compile('^.*D-.*')
    subset = []
    ord = 0
    start = False
    for line in fattr:
        line = line[:-1]
        if classify.match(line):
            ord = ord+1
            if start:
                target.append(subset[:])
            start = True
            del subset[:]
            continue
        if start and cando.match(line):
            tmp = line.split(',')
            for dddd in tmp:
                to = re.compile('^.*\ to\ .*')
                if to.match(dddd):
                    temp = dddd.split(' ')
                    fi = True
                    begin = ''
                    end = ''
                    for dttt in temp:
                        cd = re.compile('^D-.*')
                        if cd.match(dttt) and fi:
                            begin = dttt
                            fi = False
                        elif cd.match(dttt):
                            end = dttt
                    bday = re.search(r'\d+', begin[2:]).group()
                    eday = re.search(r'\d+', end[2:]).group()
                    num = 2+len(eday)
                    my = end[num:]
                    for x in range(int(bday), int(eday)+1):
                        subset.append("D-"+str(x)+my)
                    # for x in range(int(eday[0]) - int(bday[0])):
                        # subset.append(x)
                else:
                    temp = dddd.split(' ')
                    for dttt in temp:
                        cd = re.compile('^D-.*')
                        if cd.match(dttt):
                            subset.append(dttt)
    target.append(subset[:])


Classify()
