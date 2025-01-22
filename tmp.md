``

+----------------+                     +----------------+
|   Switch A     |---------------------|   Switch B     |
|  VLAN 2: .1    |                     |  VLAN 2: .2    |
|  Priority 120  |                     |  Priority 110  |
|  Active HSRP   |                     |  Standby HSRP  |
|  VIP: .254     |                     |  VIP: .254     |
+----------------+                     +----------------+
       ||                                     ||
       ||                                     ||
       \/                                     \/
+----------------+                     +----------------+
|   Switch C     |---------------------|   Switch D     |
|  VLAN 2: .3    |                     |  VLAN 2: .4    |
|  Priority 105  |                     |  Priority 100  |
|  Backup HSRP   |                     |  Backup HSRP   |
|  VIP: .254     |                     |  VIP: .254     |
+----------------+                     +----------------+

``

``
sw a

interface Vlan2
 ip address 192.168.2.1 255.255.255.0  # Physical IP of Switch A
 standby 1 ip 192.168.2.254           # Virtual IP for HSRP Group 1
 standby 1 priority 120               # Highest priority for Active role
 standby 1 preempt                    # Allow preemption
 standby 1 authentication md5 key-string MyHSRPKey

# Trunk links to other switches
interface GigabitEthernet1/1
 description Link to Switch B
 switchport mode trunk
 switchport trunk allowed vlan 2

interface GigabitEthernet1/2
 description Link to Switch C
 switchport mode trunk
 switchport trunk allowed vlan 2
``

``
sw b

interface Vlan2
 ip address 192.168.2.2 255.255.255.0  # Physical IP of Switch B
 standby 1 ip 192.168.2.254           # Virtual IP for HSRP Group 1
 standby 1 priority 110               # Lower priority for Standby role
 standby 1 preempt                    # Allow preemption
 standby 1 authentication md5 key-string MyHSRPKey

# Trunk links to other switches
interface GigabitEthernet1/1
 description Link to Switch A
 switchport mode trunk
 switchport trunk allowed vlan 2

interface GigabitEthernet1/2
 description Link to Switch D
 switchport mode trunk
 switchport trunk allowed vlan 2
``

``
sw c

interface Vlan2
 ip address 192.168.2.3 255.255.255.0  # Physical IP of Switch C
 standby 1 ip 192.168.2.254           # Virtual IP for HSRP Group 1
 standby 1 priority 105               # Lower priority
 standby 1 preempt                    # Allow preemption
 standby 1 authentication md5 key-string MyHSRPKey

# Trunk links to other switches
interface GigabitEthernet1/1
 description Link to Switch D
 switchport mode trunk
 switchport trunk allowed vlan 2

interface GigabitEthernet1/2
 description Link to Switch A
 switchport mode trunk
 switchport trunk allowed vlan 2
``

``
sw d

interface Vlan2
 ip address 192.168.2.4 255.255.255.0  # Physical IP of Switch D
 standby 1 ip 192.168.2.254           # Virtual IP for HSRP Group 1
 standby 1 priority 100               # Lowest priority
 standby 1 preempt                    # Allow preemption
 standby 1 authentication md5 key-string MyHSRPKey

# Trunk links to other switches
interface GigabitEthernet1/1
 description Link to Switch C
 switchport mode trunk
 switchport trunk allowed vlan 2

interface GigabitEthernet1/2
 description Link to Switch B
 switchport mode trunk
 switchport trunk allowed vlan 2
 ``
