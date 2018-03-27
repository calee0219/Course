#!/usr/bin/env python
from mininet.topo import Topo
from mininet import net
from mininet.net import Mininet

POD_NUM = 4

class FatTreeTopoHardCodeOrder(Topo):
    """
    A Simple FatTree Topo
    """

    def __init__(self):
        # Initialize topology
        Topo.__init__(self)

        # Create pod and core
        ## p0
        p0h1 = self.addHost('p0h1')
        p0h2 = self.addHost('p0h2')
        p0h3 = self.addHost('p0h3')
        p0h4 = self.addHost('p0h4')
        p1h1 = self.addHost('p1h1')
        p1h2 = self.addHost('p1h2')
        p1h3 = self.addHost('p1h3')
        p1h4 = self.addHost('p1h4')
        p2h1 = self.addHost('p2h1')
        p2h2 = self.addHost('p2h2')
        p2h3 = self.addHost('p2h3')
        p2h4 = self.addHost('p2h4')
        p3h1 = self.addHost('p3h1')
        p3h2 = self.addHost('p3h2')
        p3h3 = self.addHost('p3h3')
        p3h4 = self.addHost('p3h4')
        ## Edge Switch
        p0e1 = self.addSwitch('p0e1')
        p0e2 = self.addSwitch('p0e2')
        p1e1 = self.addSwitch('p1e1')
        p1e2 = self.addSwitch('p1e2')
        p2e1 = self.addSwitch('p2e1')
        p2e2 = self.addSwitch('p2e2')
        p3e1 = self.addSwitch('p3e1')
        p3e2 = self.addSwitch('p3e2')
        ## Aggregation
        p0a1 = self.addSwitch('p0a1')
        p0a2 = self.addSwitch('p0a2')
        p1a1 = self.addSwitch('p1a1')
        p1a2 = self.addSwitch('p1a2')
        p2a1 = self.addSwitch('p2a1')
        p2a2 = self.addSwitch('p2a2')
        p3a1 = self.addSwitch('p3a1')
        p3a2 = self.addSwitch('p3a2')
        # Add core switch
        p0c = self.addSwitch('p0c')
        p1c = self.addSwitch('p1c')
        p2c = self.addSwitch('p2c')
        p3c = self.addSwitch('p3c')

        # Add links (100Mbps)
        ## Agg <-> Edge
        self.addLink(p0a1, p0e1, bw=100)
        self.addLink(p0a1, p0e2, bw=100)
        self.addLink(p0a2, p0e1, bw=100)
        self.addLink(p0a2, p0e2, bw=100)
        ## Edge <-> Host
        self.addLink(p0e1, p0h1, bw=100)
        self.addLink(p0e1, p0h2, bw=100)
        self.addLink(p0e2, p0h3, bw=100)
        self.addLink(p0e2, p0h4, bw=100)

        # Add links (100Mbps)
        ## Agg <-> Edge
        self.addLink(p1a1, p1e1, bw=100)
        self.addLink(p1a1, p1e2, bw=100)
        self.addLink(p1a2, p1e1, bw=100)
        self.addLink(p1a2, p1e2, bw=100)
        ## Edge <-> Host
        self.addLink(p1e1, p1h1, bw=100)
        self.addLink(p1e1, p1h2, bw=100)
        self.addLink(p1e2, p1h3, bw=100)
        self.addLink(p1e2, p1h4, bw=100)

        # Add links (100Mbps)
        ## Agg <-> Edge
        self.addLink(p2a1, p2e1, bw=100)
        self.addLink(p2a1, p2e2, bw=100)
        self.addLink(p2a2, p2e1, bw=100)
        self.addLink(p2a2, p2e2, bw=100)
        ## Edge <-> Host
        self.addLink(p2e1, p2h1, bw=100)
        self.addLink(p2e1, p2h2, bw=100)
        self.addLink(p2e2, p2h3, bw=100)
        self.addLink(p2e2, p2h4, bw=100)

        # Add links (100Mbps)
        ## Agg <-> Edge
        self.addLink(p3a1, p3e1, bw=100)
        self.addLink(p3a1, p3e2, bw=100)
        self.addLink(p3a2, p3e1, bw=100)
        self.addLink(p3a2, p3e2, bw=100)
        ## Edge <-> Host
        self.addLink(p3e1, p3h1, bw=100)
        self.addLink(p3e1, p3h2, bw=100)
        self.addLink(p3e2, p3h3, bw=100)
        self.addLink(p3e2, p3h4, bw=100)


        # Link Core to pod
        ## p0c
        self.addLink(p0c, p0a1, bw=1000, loss=2)
        self.addLink(p0c, p1a1, bw=1000, loss=2)
        self.addLink(p0c, p2a1, bw=1000, loss=2)
        self.addLink(p0c, p3a1, bw=1000, loss=2)
        ## p1c
        self.addLink(p1c, p0a1, bw=1000, loss=2)
        self.addLink(p1c, p1a1, bw=1000, loss=2)
        self.addLink(p1c, p2a1, bw=1000, loss=2)
        self.addLink(p1c, p3a1, bw=1000, loss=2)
        ## p2c
        self.addLink(p2c, p0a2, bw=1000, loss=2)
        self.addLink(p2c, p1a2, bw=1000, loss=2)
        self.addLink(p2c, p2a2, bw=1000, loss=2)
        self.addLink(p2c, p3a2, bw=1000, loss=2)
        ## p3c
        self.addLink(p3c, p0a2, bw=1000, loss=2)
        self.addLink(p3c, p1a2, bw=1000, loss=2)
        self.addLink(p3c, p2a2, bw=1000, loss=2)
        self.addLink(p3c, p3a2, bw=1000, loss=2)

topos = {'fattree': (lambda: FatTreeTopoHardCodeOrder())}
