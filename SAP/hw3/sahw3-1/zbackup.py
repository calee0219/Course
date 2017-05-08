#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

import os
import subprocess
import sys
import getopt
import datetime
import time
import re

def main(argv):
    try:
        opts, args = getopt.getopt(argv,"hl:d:",["help","list=","delete="])
    except getopt.GetoptError:
        help()
        sys.exit(2)
    if len(opts) != 0:
        opt, arg = opts[0]
        if opt == ('-h' or '--help'):
            help()
            sys.exit()
        elif opt in ("-l", "--list"):
            list(opt,arg,args)
        elif opt in ("-d", "--delete"):
            dele(arg,args)
    else:
        crea(opts,args)

def list(opt,arg,args):
    proc = subprocess.Popen(['zfs','list','-t', 'snapshot', '-H', '-o', 'name', '-r', arg], stdout=subprocess.PIPE)
    output = proc.stdout.read().split()
    name = []
    for i in output:
        tmp = str(i)
        f = tmp.index("@")+1
        e = len(tmp)-1
        temp = tmp[f:f+10]+" "+tmp[f+11:e]
        name.append(temp)
    print ("ID\tDataset\t\tTime")
    ord = 0
    for tim in name:
        ord = ord+1
        if len(args) != 0 and str(ord) in args: continue
        print (ord, end="", flush=True)
        print ("\t", end="", flush=True)
        print (arg+'\t'+tim)

def dele(arg,args):
    proc = subprocess.Popen(['zfs','list','-t', 'snapshot', '-H', '-o', 'name', '-r', arg], stdout=subprocess.PIPE)
    output = proc.stdout.read().split()
    name = []
    for i in output:
        tmp = str(i)
        f = tmp.index("@")+1
        e = len(tmp)-1
        temp = tmp[f:e]
        name.append(temp)
    ord = 0
    for tim in name:
        ord = ord+1
        if len(args) == 0:
            os.system("zfs destroy "+arg+"@"+tim)
        if len(args) != 0 and str(ord) in args:
            os.system("zfs destroy "+arg+"@"+tim)

def crea(opts,args):
    if len(args) == 1:
        opt = args[0]
        arg = "20"
        proc = subprocess.Popen(['zfs','list','-t', 'snapshot', '-H', '-o', 'name', '-r', opt], stdout=subprocess.PIPE)
        output = proc.stdout.read().split()
        total = 0;
        for i in output:
            total=total+1
        if total >= int(arg):
            num = total-int(arg)
            for i in range(num):
                arr = [str(1)]
                dele(opt,arr)
            arr = [str(1)]
            dele(opt,arr)
        os.system("zfs snapshot "+opt+"@"+datetime.datetime.now().strftime("%Y-%m-%d-%H:%M:%S.%f"))
    else:
        opt = args[0]
        arg = args[1]
        proc = subprocess.Popen(['zfs','list','-t', 'snapshot', '-H', '-o', 'name', '-r', opt], stdout=subprocess.PIPE)
        output = proc.stdout.read().split()
        total = 0;
        for i in output:
            total=total+1
        if total >= int(arg):
            num = total-int(arg)
            for i in range(num):
                arr = [str(1)]
                dele(opt,arr)
            arr = [str(1)]
            dele(opt,arr)
        os.system("zfs snapshot "+opt+"@"+datetime.datetime.now().strftime("%Y-%m-%d-%H:%M:%S.%f"))

def help():
    print ('usage: ./zbackup.py [--list | --delete] target dataset [ID]')
    print ('usage: ./zbackup.py target dataset [rotation count]')

if __name__ == "__main__":
    if len(sys.argv) == 1:
        help()
    else:
        main(sys.argv[1:])

# vim:set nu et ts=4 sw=4 cino=>4:
