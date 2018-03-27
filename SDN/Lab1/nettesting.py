#!/usr/bin/env python

from FatTreeTopo import FatTreeTopo

from mininet.topo import Topo
from mininet.net import Mininet
from mininet.link import TCLink
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel
from mininet.node import RemoteController
from mininet.cli import CLI
# from mininet.node import CPULimitedHost

def perfTest():
    topo = FatTreeTopo()
    net = Mininet(topo=topo, link=TCLink, controller=None)
    net.addController('myController', \
                      controller=RemoteController, \
                      ip='10.0.2.15', port=6653)
    # net = Mininet(topo=topo, host=CPULimitedHost, link=TCLink)
    net.start()
    #net.waitConnected()
    print('Dumping host connections')
    dumpNodeConnections(net.hosts)
    print('Testing network connections')
    net.pingFull()
    # net.pingAll(timeout=1)
    print('Testing bandwidth')
    # get host
    p0h1 = net.get('p0h1')
    p0h3 = net.get('p0h3')
    p3h1 = net.get('p3h1')
    # start iperf server
    p0h1.popen('iperf -s -u -i 1', shell=True)
    p3h1.popen('iperf -s -u -i 1', shell=True)
    # start iperf client testing
    p0h3.cmdPrint('iperf -c {} -u -t 10 -i -b 100m'.format(p0h1.IP()))
    p0h3.cmdPrint('iperf -c {} -u -t 10 -i -b 100m'.format(p3h1.IP()))
    CLI(net)
    net.stop()


if __name__ == '__main__':
    # Set log level
    # 'info', 'warning', 'critical', 'error', 'debug', 'output'
    setLogLevel('info')
    perfTest()
