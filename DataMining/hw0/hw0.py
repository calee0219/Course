#!/usr/bin/env python3

import numpy as np
import pandas as pd
from sklearn import preprocessing
from sklearn.preprocessing import Imputer
from sklearn.metrics import pairwise
from pyproj import Geod
import pymysql

# load data
# df = pd.read_csv('~/Jupyter/DataMining/201707-citibike-tripdata.csv')

# replace birth nan with means
# ----------------------------------------------------------------------------
# print(pd.isnull(df).sum() > 0)

# birth_mean = df['birth year'].mean()
# df = df.fillna(birth_mean)

# Clean start time >= end time
# ----------------------------------------------------------------------------
# df = df.drop(df.index[df['starttime'] >= df['stoptime']])
# df = df.reset_index(drop=True)

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

from sqlalchemy import create_engine
import bisect
import datetime
from collections import defaultdict

engine = create_engine('mysql://calee0219:110010@localhost/citybike')
path = pd.read_sql_table(table_name='path', con=engine)

try:
    in_out = pd.read_sql_table(table_name='in_out', con=engine)
except:
    begin = datetime.datetime(2017, 7, 1, 0, 0, 0)
    end = datetime.datetime(2017, 8, 1, 23, 30, 0)
    date_list = [ end - datetime.timedelta(seconds=x*60*30) for x in range(0, 1536)][::-1]
    print(date_list)

    table = {}
    for idx, row in path.iterrows():
        start_date = row['starttime']
        start = date_list[bisect.bisect_right(date_list, start_date)]
        end_date = row['stoptime']
        if end_date > datetime.datetime(2017,8,1,1,0,0):
            print(end_date)
        end = date_list[bisect.bisect_right(date_list, end_date)]
        # print(start)
        # print(end)
        start_tmp = (row['start_station_id'], start)
        if table.get(start_tmp) == None:
            table[start_tmp] = (1,0)
        else:
            tmp = list(table[start_tmp])
            tmp[0] += 1
            table[start_tmp] = tuple(tmp)
        stop_tmp = (row['end_station_id'], start)
        if table.get(stop_tmp) == None:
            table[stop_tmp] = (0,1)
        else:
            tmp = list(table[stop_tmp])
            tmp[1] += 1
            table[stop_tmp] = tuple(tmp)
    tmp_in_out = []
    for key in table.keys():
        tmp_in_out.append([key[0], key[1], table[key][0], table[key][1]])
    in_out = pd.DataFrame(tmp_in_out, columns=['id', 'time', 'in', 'out'])
    in_out.to_sql(name='in_out', con=engine, if_exists='fail',index=False)
