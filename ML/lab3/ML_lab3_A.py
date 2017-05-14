#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import pandas as pd
import numpy as np
from sklearn.naive_bayes import GaussianNB


def Classify(data):
    for i in range(data.shape[0]):
        data.loc[i,'SS-IN'] = int(float(data.loc[i,'SS-IN']) / 100)
        data.loc[i,'SED-IN'] = int(float(data.loc[i,'SED-IN']) / 2)
        data.loc[i,'COND-IN'] = int(float(data.loc[i,'COND-IN']) / 200)
        data.loc[i,'SS-OUT'] = int(float(data.loc[i,'SS-OUT']) / 10)
        data.loc[i,'SED-OUT'] = int(float(data.loc[i,'SED-OUT']) / 1000)
        data.loc[i,'COND-OUT'] = int(float(data.loc[i,'COND-OUT']) / 100)


def Frequency_Table(data, f_table, alpha=10):
    # how many data for each target
    target_count = dict(data.iloc[:,6].value_counts())
    for i in range(data.shape[1]-1): # i features for each data
        # for 2D dict, add the first D
        table_list = {}
        feature_layer_up = {}
        feature_layer_do = {}
        for j in target_count:
            feature_layer_up[j] = 0
            feature_layer_do[j] = 1000
        for j in range(data.shape[0]): # j rows in dataset
            target = data.iloc[j,6]
            match_f = data.iloc[j,i]
            feature_layer_do[target] = min(feature_layer_do[target],match_f)
            feature_layer_up[target] = max(feature_layer_up[target],match_f)
            # add the second D to 2D dict
            if not (target in table_list):
                table_list[target] = {}
            if not (match_f in table_list[target]):
                table_list[target][match_f] = 0
            # table_list[target][match_f] += 1/target_count[target];
            table_list[target][match_f] += 1;
        # Laplace smoothing
        for j in target_count:
            rg = int(feature_layer_up[j] - feature_layer_do[j]) + 1
            for k in range(int(feature_layer_do[j]), int(feature_layer_up[j])+1):
                if k in table_list[j]:
                    table_list[j][k] = (table_list[j][k]+alpha)/(target_count[j]+alpha*rg)
                else:
                    table_list[j][k] = alpha/(target_count[j]+alpha*rg)
        f_table.append(table_list)


if __name__ == "__main__":
    data = pd.read_csv('./A.csv')
    print("train origin")
    print(data)
    Classify(data)
    print("\ntrain after classify")
    print(data)
    # target count & P
    target_count = dict(data.iloc[:,6].value_counts())
    target_P = {}
    for i in target_count:
        target_P[i] = target_count[i]/13
    print(target_P)
    # frequency table
    f_table = [] # list of 2D dict: [feature_num][target][bin] -> P
    # (fequency_table, k for laplace smooth)
    Frequency_Table(data, f_table)
    ord = 0
    for i in f_table:
        print()
        for j in i:
            for k in i[j]:
                print("P(", end='')
                print(data.columns.values[ord], end='=')
                print(k, end='|')
                print(j, end=')=')
                # print(i[j][k], end='\t')
                print("%.2f" % i[j][k], end='\t')
            print()
        ord += 1

    # Read test in
    test = pd.DataFrame({
        'SS-IN'    : pd.Series([222]),
        'SED-IN'   : pd.Series([4.5]),
        'COND-IN'  : pd.Series([1518]),
        'SS-OUT'   : pd.Series([74]),
        'SED-OUT'  : pd.Series([0.25]),
        'COND-OUT' : pd.Series([1642]),
        })
    test.reindex_axis(['SS-IN','SED-IN','COND-IN','SS-OUT','SED-OUT','COND-OUT'], axis=1)
    print("\ntest origin")
    print(test)
    Classify(test)
    print("\ntest after classify")
    print(test)

    # propobility matrix
    ac = target_P
    for i in target_P:
        for j in range(test.shape[1]):
            if test.iloc[0,j] in f_table[j][i]:
                ac[i] *= f_table[j][i][test.iloc[0,j]]
    for i in ac:
        print(i, end=": ")
        print(ac[i])

    # # used Gausian predict
    # model = GaussianNB()
    # feature = data.iloc[:,:-1]
    # target = np.ravel(data.iloc[:,-1])
    # model.fit(feature, target)
    # pred = model.predict(test)
    # print(pred)
