#!/usr/bin/env python3

import numpy as np
import pandas as pd
from sklearn import preprocessing
from sklearn.preprocessing import Imputer
from sklearn.metrics import pairwise
from pyproj import Geod
import pymysql

# load data
df = pd.read_csv('~/Jupyter/DataMining/201707-citibike-tripdata.csv')

# replace birth nan with means
# ----------------------------------------------------------------------------
# print(pd.isnull(df).sum() > 0)

birth_mean = df['birth year'].mean()
df = df.fillna(birth_mean)

# Clean start time >= end time
# ----------------------------------------------------------------------------
df = df.drop(df.index[df['starttime'] >= df['stoptime']])
df = df.reset_index(drop=True)

# Test Speed
# ----------------------------------------------------------------------------
# import datetime
# import operator

# start = [datetime.datetime.strptime(dt, '%Y-%m-%d %H:%M:%S') for dt in df['starttime'].tolist()]
# end = [datetime.datetime.strptime(dt, '%Y-%m-%d %H:%M:%S') for dt in df['stoptime'].tolist()]

# from pyproj import Geod
# wgs84_geod = Geod(ellps='WGS84')

# def Distance(lat1,lon1,lat2,lon2):
    # az12,az21,dist = wgs84_geod.inv(lon1,lat1,lon2,lat2)
    # return dist

# dist = Distance(df['start station latitude'].tolist(), df['start station longitude'].tolist(), \
         # df['end station latitude'].tolist(), df['end station longitude'].tolist())

# speed = list(map(operator.truediv, dist/1000, [ time.seconds/3600 for time in list(map(operator.sub, end, start))]))

# zp = list(zip(speed,list(range(df.shape[0]))))
# zp.sort()

# print(zp)

# Station table
# ----------------------------------------------------------------------------

connection = pymysql.connect(host='localhost', \
			    user='calee0219', \
			    password='110010', \
			    db='citybike', \
			    charset='utf8mb4', \
			    cursorclass=pymysql.cursors.DictCursor)

try:

