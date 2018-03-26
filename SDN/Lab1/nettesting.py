#!/usr/bin/env python

from fattree import FatTree

from mininet.topo import Topo
from mininet.net import Mininet
from mininet.link import TCLink
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel
from mininet.node import RemoteController
from mininet.cli import CLI
# from mininet.node import CPULimitedHost

def perfTest():
    topo = FatTree()
    net = Mininet(topo=topo, link=TCLink, controller=None)
    net.addController('myController', \
                      controller=RemoteController, \
                      ip='10.0.2.15', port=6653)
    # net = Mininet(topo=topo, host=CPULimitedHost, link=TCLink)
    net.start()
    net.waitConnected()
    print('Dumping host connections')
    dumpNodeConnections(net.hosts)
    print('Testing network connections')
    # net.pingFull()
    # net.pingAll(timeout=1)
    print('Testing bandwidth')
    CLI(net)
    net.stop()


if __name__ == '__main__':
    # Set log level
    # 'info', 'warning', 'critical', 'error', 'debug', 'output'
    setLogLevel('info')
    perfTest()
