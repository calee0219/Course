#!/usr/bin/env python
from mininet.topo import Topo
from mininet import net
from mininet.net import Mininet

POD_NUM = 4

class FatTreeTopoHardCodeOrderName(Topo):
    """
    A Simple FatTree Topo
    """

    def __init__(self):
        # Initialize topology
        Topo.__init__(self)

        # Create pod and core
        ## p0
        p0h1 = self.addHost('h001')
        p0h2 = self.addHost('h002')
        p0h3 = self.addHost('h003')
        p0h4 = self.addHost('h004')
        p1h1 = self.addHost('h101')
        p1h2 = self.addHost('h102')
        p1h3 = self.addHost('h103')
        p1h4 = self.addHost('h104')
        p2h1 = self.addHost('h201')
        p2h2 = self.addHost('h202')
        p2h3 = self.addHost('h203')
        p2h4 = self.addHost('h204')
        p3h1 = self.addHost('h301')
        p3h2 = self.addHost('h302')
        p3h3 = self.addHost('h303')
        p3h4 = self.addHost('h304')
        ## Edge Switch
        p0e1 = self.addSwitch('s3001')
        p0e2 = self.addSwitch('s3002')
        p1e1 = self.addSwitch('s3003')
        p1e2 = self.addSwitch('s3004')
        p2e1 = self.addSwitch('s3005')
        p2e2 = self.addSwitch('s3006')
        p3e1 = self.addSwitch('s3007')
        p3e2 = self.addSwitch('s3008')
        ## Aggregation
        p0a1 = self.addSwitch('s2001')
        p0a2 = self.addSwitch('s2002')
        p1a1 = self.addSwitch('s2003')
        p1a2 = self.addSwitch('s2004')
        p2a1 = self.addSwitch('s2005')
        p2a2 = self.addSwitch('s2006')
        p3a1 = self.addSwitch('s2007')
        p3a2 = self.addSwitch('s2008')
        # Add core switch
        p0c = self.addSwitch('s1001')
        p1c = self.addSwitch('s1002')
        p2c = self.addSwitch('s1003')
        p3c = self.addSwitch('s1004')

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

topos = {'fattree': (lambda: FatTreeTopoHardCodeOrderName())}
