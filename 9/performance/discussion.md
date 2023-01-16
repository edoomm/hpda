# Performance analysis

Considering just I/O time I evaluated 2 main alternatives, which are the edge cases of the characteristics of the systems we can have.

## Low edge case

Here I consider the following system characteristics, with a relative poor performance:

- 10 GBit Ethernet
    - This actually gives high-speed, low-latency and large bandwidth
- 10 storage servers with 1 network interface each
    - It may be sufficient for a small to medium-sized system with moderate data storage and traffic needs
- 1 storage media equipped with HDDs
    - It may be sufficient for a small system with low storage and traffic demands
- 1 Client node, 100 MByte of data in 0.1s
    - It may be sufficient for a small system but might be a high amount of data to process in a short amount of time, and it would require a high-performance processor and sufficient memory

In short, this characteristics can work for a small system, however, the system would be hard to implement because of the high amount of data to process (100 MB in 0.1s) in the storage nodes and the low storage nodes (1 HDD).

## High edge case

Now for this case I will take the best system characteristics given:

- 100 GBit Infiniband
    - This is a very high-speed network technology that can provide large bandwidth for data transfer
- 100 storage servers
    - It may be sufficient for a large-scale system with high data storage and traffic demands
- 16 storage media equipped with SSDs
    - Depending on the requirements this could be even more than enough if we take the maximum capacity of SSDs, which is 100 TBs
- 1000 Client nodes, 100 TByte of data in 100s
    - It may be sufficient for a large-scale system with high data traffic demands

In contrast, this characteristics may be decent for a large system, but it's also important to network infrastructure, and the overall architecture of the system. It's recommended to have a thorough evaluation of the entire system and its components to ensure that all the necessary resources are in place to handle the expected traffic and data transfer rate.