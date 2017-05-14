#!/usr/bin/env python3

import pandas as pd
import numpy as np
import re
import fuckit
from sklearn.naive_bayes import GaussianNB

target = dict()

def Classify():
    fattr = open('./ML_assignment_3_attr.txt', 'r')
    classify = re.compile('(^\ --*)|(^--*)')
    cando = re.compile('^.*D-.*')
    dot = re.compile('^.*\.')
    start = False
    ord = 0
    for line in fattr:
        line = line[:-1]
        if classify.match(line):
            start = True
            ord = ord+1
        if start and cando.match(line):
            tmp = line.split(',')
            for dddd in tmp:
                to = re.compile('^.*\ to\ .*')
                if to.match(dddd):
                    print(dddd)
                    temp = dddd.split(' ')
                    getTo = False
                    begin = ''
                    end = ''
                    for dttt in temp:
                        cd = re.compile('^D-.*')
                        if dttt == "to":
                            getTo = True
                        elif cd.match(dttt) and (not getTo):
                            tmmp = ''
                            if cd.match(begin):
                                tmmp = begin
                            begin = dttt
                            if dot.match(begin):
                                begin = begin[:-1]
                            if tmmp != '':
                                # begin = (begin < tmmp)? begin : tmmp
                                if begin < tmmp:
                                    begin = begin
                                else:
                                    begin = tmmp
                        elif cd.match(dttt) and getTo:
                            tmmp = ''
                            if cd.match(end):
                                tmmp = end
                            end = dttt
                            if dot.match(end):
                                end = end[:-1]
                            if tmmp != '':
                                # end = (end < tmmp)? tmmp : end
                                if end < tmmp:
                                    end = tmmp
                                else:
                                    end = end
                    bday = re.search(r'\d+', begin[2:]).group()
                    eday = re.search(r'\d+', end[2:]).group()
                    num = 2+len(eday)
                    my = end[num:]
                    for x in range(int(bday), int(eday)+1):
                        target["D-"+str(x)+my] = ord
                else:
                    temp = dddd.split(' ')
                    for dttt in temp:
                        cd = re.compile('^D-.*')
                        if cd.match(dttt):
                            if(dot.match(dttt)): dttt = dttt[:-1]
                            target[dttt] = ord


if __name__ == "__main__":
    # find which class a date is in
    Classify()
    # read file by pandas
    data = pd.read_csv('./ML_data.csv', header=None)
    test = pd.read_csv('./ML_test.csv', header=None)
    # translate date to it's own class
    data.replace(target, inplace=True)
    test.replace(target, inplace=True)
    print(data)
