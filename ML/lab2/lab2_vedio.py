#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import pandas as pd
from sklearn.preprocessing import normalize
from sklearn.neighbors import KNeighborsClassifier as KNN
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import KFold
from scipy.spatial.distance import cosine as Cos

dataset_url = 'http://mlr.cs.umass.edu/ml/machine-learning-databases/' + \
                'wine-quality/winequality-white.csv'
data = pd.read_csv(dataset_url, sep=';')

feature = normalize(data.iloc[:, :-2])
target = data.iloc[:, -1]

start = time.time()
nbr = KNN(n_neighbors=11, weights='distance', \
        algorithm='brute', metric='manhattan')
nbr.fit(feature, target)
pred = nbr.predict(feature)
mx = confusion_matrix(target, pred)
print(mx.trace()/mx.sum())
print("===== used %s seconds =====" % (time.time()-start))


start = time.time()
kf = KFold(n_splits=12)
total_rate = 0
for train_index, test_index in kf.split(data):
    train_feature, test_feature = feature[train_index], feature[test_index]
    train_target, test_target = target[train_index], target[test_index]
    nbr = KNN(n_neighbors=11, weights='distance', \
            algorithm='brute', metric='manhattan')
    nbr.fit(train_feature, train_target)
    pred = nbr.predict(test_feature)
    mx = confusion_matrix(test_target, pred)
    total_rate += mx.trace()/mx.sum()
print(total_rate/12)
print("===== used %s seconds =====" % (time.time()-start))


# Cos re
def cosDist(a, b):
    return Cos(a, b)


start = time.time()
nbr = KNN(n_neighbors=11, algorithm='brute',  metric=cosDist)
nbr.fit(feature, target)
pred = nbr.predict(feature)
mx = confusion_matrix(target, pred)
print(mx.trace()/mx.sum())
print("===== used %s seconds =====" % (time.time()-start))
