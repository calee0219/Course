#!/usr/bin/env python3

import numpy as np
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_predict
from sklearn import metrics
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import KFold
from sklearn import tree
import random
from datetime import datetime
import pydotplus


def resubstitution():
    print("resubstitution")
    clfp = clf.fit(iris.data, iris.target)
    pred = clfp.predict(iris.data)
    cm = confusion_matrix(iris.target, pred)
    print(cm)
    print(np.trace(cm)/np.sum(cm))
    with open("iris.dot", 'w') as f:
        f = tree.export_graphviz(clfp, out_file=f)
    dot_data = tree.export_graphviz(clfp, out_file=None,
                                    feature_names=iris.feature_names,
                                    class_names=iris.target_names,
                                    filled=True, rounded=True,
                                    special_characters=True)
    graph = pydotplus.graph_from_dot_data(dot_data)
    graph.write_png("iris.png")
    # graph.write_pdf("iris.pdf")


def cross():
    print("cross")
    X_train, X_test, y_train, y_test = train_test_split(
        iris.data, iris.target, test_size=0.3, random_state=random.seed(datetime.now()))
    clfp = clf.fit(X_train, y_train)
    pred = clfp.predict(X_test)
    m = confusion_matrix(y_test, pred)
    print(m)
    print(np.trace(m)/np.sum(m))
    # predicted = cross_val_predict(clfp, X_test, y_test, cv=10)
    # print(metrics.accuracy_score(y_test, predicted))


def kfold():
    print("kFold")
    kf = KFold(n_splits=12, shuffle=True)
    mx = np.zeros((3,3))
    for train, test in kf.split(iris.data):
        X_train, X_test = iris.data[train], iris.data[test]
        y_train, y_test = iris.target[train], iris.target[test]
        clfp = clf.fit(X_train, y_train)
        pred = clfp.predict(X_test)
        m = confusion_matrix(y_test, pred, labels=[0, 1, 2])
        mx = m.reshape(3,3) + mx
    print(mx)
    print(np.trace(mx)/np.sum(mx))
    # predicted = cross_val_predict(clfp, X_test, y_test, cv=10)
    # print(metrics.accuracy_score(y_test, predicted))


iris = load_iris()
clf = tree.DecisionTreeClassifier(min_samples_split=5)
resubstitution()
cross()
kfold()
