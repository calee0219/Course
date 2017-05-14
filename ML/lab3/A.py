#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np
from sklearn.naive_bayes import GaussianNB


def Classify(data):
    for i in range(data.shape[0]):
        data.iloc[i,0] = int(float(data.iloc[i,0]) / 100)
        data.iloc[i,1] = int(float(data.iloc[i,1]) / 2)
        data.iloc[i,2] = int(float(data.iloc[i,2]) / 200)
        data.iloc[i,3] = int(float(data.iloc[i,3]) / 10)
        data.iloc[i,4] = int(float(data.iloc[i,4]) * 100)
        data.iloc[i,5] = int(float(data.iloc[i,5]) / 100)


if __name__ == "__main__":
    data = pd.read_csv('./A.csv')
    print("train origin")
    print(data)
    Classify(data)
    print("\ntrain after classify")
    print(data)
    # target count
    t_count = dict(data.iloc[:,6].value_counts())
    # frequency table
    f_table = []
    for i in range(6):
        table_list = {}
        for j in range(data.shape[0]):
            if not (data.iloc[j,6] in table_list):
                table_list[data.iloc[j,6]] = {}
            if not (data.iloc[j,i] in table_list[data.iloc[j,6]]):
                table_list[data.iloc[j,6]][data.iloc[j,i]] = 0
            table_list[data.iloc[j,6]][data.iloc[j,i]] += 1/t_count[data.iloc[j,6]];
        f_table.append(table_list)
    ord = 0
    for i in f_table:
        for j in i:
            for k in i[j]:
                print("P(", end='')
                print(data.columns.values[ord], end='=')
                print(k, end='|')
                print(j, end=')=')
                # print(i[j][k], end='\t')
                print("%.2f" % i[j][k], end='\t')
            print()
        print()
        ord += 1

    # Read test in
    test = pd.DataFrame({ 'SS-IN'    : pd.Series([222]),
                          'SED-IN'   : pd.Series([4.5]),
                          'COND-IN'  : pd.Series([1518]),
                          'SS-OUT'   : pd.Series([74]),
                          'SED-OUT'  : pd.Series([0.25]),
                          'COND-OUT' : pd.Series([1642]) })
    print("\ntest origin")
    print(test)
    Classify(test)
    print("\ntest after classify")
    print(test)

    # propobility matrix
    ac = t_count
    for i in t_count:
        for j in range(test.shape[1]):
            if test.iloc[0,j] in f_table[j][i]:
                ac[i] *= f_table[j][i][test.iloc[0,j]]
    for i in ac:
        print(i, end=" ")
        print(ac[i])

    # # used Gausian predict
    # model = GaussianNB()
    # feature = data.iloc[:,:-1]
    # target = np.ravel(data.iloc[:,-1])
    # model.fit(feature, target)
    # pred = model.predict(test)
    # print(pred)
