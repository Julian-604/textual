             Area 0 (Backbone)
          +------------------+                        +------------------+
          |    Router1 (R1)  |                        |    Router4 (R4)  |
          |   ABR: 0 & 1     |                        |   ABR: 0 & 2     |
          +------------------+                        +------------------+
              | 192.168.0.1                                 | 192.168.0.2
              |                                             |
      ---------------------------                   ---------------------------
             | Area 1                                    | Area 2
      +------------------+                        +------------------+
      |    Router2 (R2)  |                        |    Router5 (R5)  |
      |    Internal Area |                        |    Internal Area |
      +------------------+                        +------------------+
LAN1: 192.168.1.0/24                             LAN2: 192.168.2.0/24
       Hosts                                         Hosts

``
Configuration Details
Router1 (R1: ABR for Area 0 & Area 1)
``
``
R1(config)# router ospf 1
R1(config-router)# network 192.168.0.0 0.0.0.255 area 0
R1(config-router)# network 192.168.1.0 0.0.0.255 area 1
``
``
Router2 (R2: Internal Router in Area 1)
R2(config)# router ospf 1
R2(config-router)# network 192.168.1.0 0.0.0.255 area 1
``
``
Router4 (R4: ABR for Area 0 & Area 2)
R4(config)# router ospf 1
R4(config-router)# network 192.168.0.0 0.0.0.255 area 0
R4(config-router)# network 192.168.2.0 0.0.0.255 area 2
``
``
Router5 (R5: Internal Router in Area 2)
R5(config)# router ospf 1
R5(config-router)# network 192.168.2.0 0.0.0.255 area 2
``
``
Adding LAN Segments
LAN1 on Router2 (Area 1):
Subnet: 192.168.1.0/24
Interface Configuration:
R2(config)# interface FastEthernet0/0
R2(config-if)# ip address 192.168.1.1 255.255.255.0
R2(config-if)# no shutdown
``
``
LAN2 on Router5 (Area 2):
Subnet: 192.168.2.0/24
Interface Configuration:
R5(config)# interface FastEthernet0/0
R5(config-if)# ip address 192.168.2.1 255.255.255.0
R5(config-if)# no shutdown
``

