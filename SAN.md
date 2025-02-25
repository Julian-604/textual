**Basic Terms in SAN ** 
---
1. Storage Area Network (SAN) 
A dedicated high-speed network that connects servers to shared block-level storage devices (e.g., disk arrays). Unlike NAS (Network Attached Storage), SANs focus on **block-level data** for performance-critical workloads. 
---
2. Block-Level Storage 
Data is stored in fixed-size "blocks," managed by the server’s OS. Used for databases, virtual machines, and applications requiring low latency. 
---
3. Fibre Channel (FC)
A high-speed networking technology (up to 128 Gbps today) designed for SANs. Uses dedicated **FC switches** and **HBAs** (Host Bus Adapters) for lossless, low-latency communication. 
---
4. iSCSI (Internet Small Computer System Interface)
A protocol that transports SCSI commands over IP networks (Ethernet). Enables SANs using standard Ethernet infrastructure, reducing costs compared to FC. 
---
5. FCoE (Fibre Channel over Ethernet)
Encapsulates Fibre Channel frames within Ethernet packets, allowing FC SAN traffic to run over converged Ethernet networks. 
---
6. LUN (Logical Unit Number) 
A unique identifier assigned to a logical storage unit (e.g., a disk, partition, or array). Servers access storage via LUNs mapped over the SAN. 
---
7. HBA (Host Bus Adapter)
A hardware card (e.g., FC HBA or iSCSI HBA) that connects servers to the SAN. Acts as an interface between the server and storage network. 
---
8. Zoning
A method to segment a SAN fabric into smaller groups, controlling which HBAs can communicate with specific storage devices (improves security and traffic management). 
---
9. WWN (World Wide Name)
A unique 64-bit identifier for FC devices (HBAs, switches, storage arrays). Two types: **WWPN** (World Wide Port Name) and **WWNN** (World Wide Node Name). 
---
10. RAID (Redundant Array of Independent Disks)
A method to combine multiple disks into a single logical unit for redundancy, performance, or both (e.g., RAID 0, 1, 5,6,10). 
---
11. Storage Array
A dedicated storage system (e.g.,Hitachi,Dell EMC,Huawei,Pure Storage FlashArray) that provides centralized block storage to servers via the SAN. 
---
12. Multipathing
Using multiple physical paths (e.g., FC links) between a server and storage to ensure redundancy and load balancing. 
---
13. LUN Masking
A security layer that restricts server access to specific LUNs, preventing unauthorized storage access. 
---
14. SAN Fabric
The network infrastructure (switches, cables, HBAs) connecting SAN components. 
---
15. Cache
High-speed memory (e.g., DRAM, NVRAM) in storage arrays to temporarily hold frequently accessed data, boosting performance. 
---
16. Thin Provisioning
Allocating storage capacity dynamically as needed, rather than reserving fixed space upfront (reduces waste). 
---
17. Snapshot
A point-in-time copy of data for backup, recovery, or testing. 
---
18. Replication
Copying data between storage systems (locally or remotely) for disaster recovery (DR) or redundancy. 
