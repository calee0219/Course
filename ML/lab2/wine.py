#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
from sklearn.neighbors import KNeighborsClassifier as KNN
from sklearn.model_selection import KFold
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import normalize
from scipy.spatial.distance import cosine
import pandas as pd
import numpy as np

dataset_url = 'http://mlr.cs.umass.edu/ml/machine-learning-databases/' + \
                'wine-quality/winequality-white.csv'
data = pd.read_csv(dataset_url, sep=';')
# ls = list(data)
# ls.remove('quality')
# feature = pd.DataFrame(data, columns=ls)
# target = pd.DataFrame(data, columns=['quality'])
feature = normalize(data.iloc[:, :-1])
target = np.ravel(data.iloc[:, -1])


def cosDist(x, y):
    return cosine(x, y)


def resubstation(dist, algo):
    print("resubstation, algo=%s, dist=%s" % (algo, dist))
    start_time = time.time()
    if dist == 'cosDist':
        nbr = KNN(n_neighbors=13, algorithm=algo,
                  metric=cosDist)
    else:
        nbr = KNN(n_neighbors=13, algorithm=algo,
                  metric=dist, weights='distance')
    nbr.fit(feature, target)
    print("---- training time: %s sec ----" % (time.time() - start_time))
    start_time = time.time()
    pred = nbr.predict(feature)
    m = confusion_matrix(target, pred,
                         labels=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    print(m)
    print(np.trace(m)/np.sum(m))
    print("==== predict time: %s sec ====" % (time.time() - start_time))


def kfold(dist, algo, foldNum):
    print("kFold, foldNum=%d, algo=%s, dist=%s" % (foldNum, algo, dist))
    start_time = time.time()
    kf = KFold(n_splits=12, shuffle=True)
    total_rate = 0
    total_train_time = 0
    total_pred_time = 0
    mx = np.zeros((11, 11))
    for train, test in kf.split(feature):
        train_feature, test_feature = feature[train], feature[test]
        train_target, test_target = target[train], target[test]
        start = time.time()
        if dist == 'cosDist':
            nbr = KNN(n_neighbors=13, algorithm=algo,
                      metric=cosDist)
        else:
            nbr = KNN(n_neighbors=13, algorithm=algo,
                      metric=dist, weights='distance')
        nbr.fit(train_feature, train_target)
        total_train_time += (time.time() - start)
        start = time.time()
        pred = nbr.predict(test_feature)
        total_pred_time += (time.time() - start)
        m = confusion_matrix(test_target, pred,
                             labels=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        mx += m
        rate = np.trace(m)/np.sum(m)
        total_rate += rate
    print(mx)
    print(total_rate/12)
    print("average time of train: %s sec" % (total_train_time/12))
    print("average time of predict: %s sec" % (total_pred_time/12))
    print("==== kFold total training time: %s seconds ===="
          % (time.time() - start_time))


resubstation(dist='manhattan', algo='brute')
resubstation(dist='manhattan', algo='kd_tree')
resubstation(dist='manhattan', algo='ball_tree')
print()
resubstation(dist='euclidean', algo='brute')
resubstation(dist='euclidean', algo='kd_tree')
resubstation(dist='euclidean', algo='ball_tree')
print()
kfold(dist='manhattan', algo='brute', foldNum=12)
kfold(dist='manhattan', algo='kd_tree', foldNum=12)
kfold(dist='manhattan', algo='ball_tree', foldNum=12)
print()
kfold(dist='euclidean', algo='brute', foldNum=12)
kfold(dist='euclidean', algo='kd_tree', foldNum=12)
kfold(dist='euclidean', algo='ball_tree', foldNum=12)
print()
resubstation(dist='mahalanobis', algo='brute')
kfold(dist='mahalanobis', algo='brute', foldNum=12)
print()
resubstation(dist='cosDist', algo='brute')
kfold(dist='cosDist', algo='brute', foldNum=12)

