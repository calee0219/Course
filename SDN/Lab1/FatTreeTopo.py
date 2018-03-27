#!/usr/bin/env python
from mininet.topo import Topo
from mininet import net
from mininet.net import Mininet

POD_NUM = 4

class FatTreeTopo(Topo):
    """
    A Simple FatTree Topo
    """

    def create_pod(self, order):
        # Add host and switch
        ## Host
        h1 = self.addHost('p{}h1'.format(order))
        h2 = self.addHost('p{}h2'.format(order))
        h3 = self.addHost('p{}h3'.format(order))
        h4 = self.addHost('p{}h4'.format(order))
        ## Edge Switch
        e1 = self.addSwitch('p{}e1'.format(order))
        e2 = self.addSwitch('p{}e2'.format(order))
        ## Aggregation
        a1 = self.addSwitch('p{}a1'.format(order))
        a2 = self.addSwitch('p{}a2'.format(order))

        # Add links (100Mbps)
        ## Agg <-> Edge
        self.addLink(a1, e1, bw=100)
        self.addLink(a1, e2, bw=100)
        self.addLink(a2, e1, bw=100)
        self.addLink(a2, e2, bw=100)
        ## Edge <-> Host
        self.addLink(e1, h1, bw=100)
        self.addLink(e1, h2, bw=100)
        self.addLink(e2, h3, bw=100)
        self.addLink(e2, h4, bw=100)

        return {'h1': h1, 'h2': h2, 'h3': h3, 'h4': h4, \
                'e1': e1, 'e2': e2, 'a1': a1, 'a2': a2}

    def __init__(self):
        # Initialize topology
        Topo.__init__(self)

        # Create pod and core
        c = {} # core switch
        p = {} # pod
        for pod_ord in range(POD_NUM):
            p[pod_ord] = self.create_pod(pod_ord)
            c[pod_ord] = self.addSwitch('p{}c'.format(pod_ord))

        # Link Core to pod
        for core_pod_ord in range(POD_NUM):
            if core_pod_ord < (POD_NUM / 2):
                for agg_pod_ord in range(POD_NUM):
                    self.addLink('p{}c'.format(core_pod_ord), \
                                 'p{}a1'.format(agg_pod_ord), \
                                 bw=1000, loss=2)
            else:
                for agg_pod_ord in range(POD_NUM):
                    self.addLink('p{}c'.format(core_pod_ord), \
                                 'p{}a2'.format(agg_pod_ord), \
                                 bw=1000, loss=2)

topos = {'fattree': (lambda: FatTreeTopo())}
