# SDN Lab1

This is a Lab of 2018 NCUT SDN course. We must simulate a FatTree Topo using mininet and Test the connect.

The Controller is using floodlight in this Lab.

I use FatTree.py as my Network Topology and nettesting.py as tool to test it.

I try to functional my code in FatTree.py. But there is a problem that I can't ping others except host in pod1.

That's wire. I think if it's because I'm not so falimer with python method. So I work in FatTreeHardCode, which hardcode every node.

There still leave the same problem. I discuss with my classmate and wondering if it's because of the order of my switch / host create. So I change it.

The problem still left... I was so desperate. We thoute that the only different between my hw and my classmate is how I named each switch...

I change to s1001, h001...

AND

It works.............................................

WTF!!!

maybe mininet only can parse this kind of namespace?

## How to RUN

- `FatTreeTopoHardCodeOrderName` as the topo file.
    You can use the command below to run it.
    ```sh
    sudo mn --custom ./FatTreeTopoHardCodeOrder.py --link=tc --controller=remote,ip=127.0.0.1 --topo fattree
    ```
- `nettesting.py` as the testing file
    Using `sudo ./nettesting.py` to run the testing.
