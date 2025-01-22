To configure EtherChannel (Port-Channel) between all links in your topology, where **Switch A**, **Switch B**, **Switch C**, and **Switch D** are interconnected, follow these steps.

### **EtherChannel Overview**
- **Mode**: Use either **LACP** (Link Aggregation Control Protocol, IEEE 802.3ad) or **Static EtherChannel**.
- **Interface Range**: Define the links to bundle into the EtherChannel group (e.g., Gi1/1, Gi1/2, etc.).
- **Port-Channel**: Logical interface for the EtherChannel (e.g., Po1).

---

```bash
+----------------+--------------------+--------------------+--------------------+
|    Device      | VLAN 2 IP Address   | HSRP Virtual IP    | HSRP Status        |
+----------------+--------------------+--------------------+--------------------+
| Switch A       | 192.168.2.1         | 192.168.2.254      | Active (Priority 110) |
| Switch B       | 192.168.2.2         | 192.168.2.254      | Standby (Priority 100) |
| Switch C       | 192.168.2.3         | 192.168.2.254      | Standby (Priority 100) |
| Switch D       | 192.168.2.4         | 192.168.2.254      | Standby (Priority 100) |
+----------------+--------------------+--------------------+--------------------+
```


### **Topology and VLAN**
- VLAN: **2** (Trunk allowed VLAN)
- Trunk Mode: **802.1Q**
- **Switch Pairs**:
  - **Switch A ↔ Switch B**: EtherChannel Po1
  - **Switch A ↔ Switch C**: EtherChannel Po2
  - **Switch B ↔ Switch D**: EtherChannel Po3
  - **Switch C ↔ Switch D**: EtherChannel Po4

---

### **Configuration**

#### **Switch A**
```bash
# EtherChannel between Switch A and Switch B (Po1)
interface range GigabitEthernet1/1 - 1/2
 channel-group 1 mode active         # LACP Active mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel1
 switchport mode trunk
 switchport trunk allowed vlan 2

# EtherChannel between Switch A and Switch C (Po2)
interface range GigabitEthernet1/3 - 1/4
 channel-group 2 mode active         # LACP Active mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel2
 switchport mode trunk
 switchport trunk allowed vlan 2
```

---

#### **Switch B**
```bash
# EtherChannel between Switch B and Switch A (Po1)
interface range GigabitEthernet1/1 - 1/2
 channel-group 1 mode passive        # LACP Passive mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel1
 switchport mode trunk
 switchport trunk allowed vlan 2

# EtherChannel between Switch B and Switch D (Po3)
interface range GigabitEthernet1/3 - 1/4
 channel-group 3 mode active         # LACP Active mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel3
 switchport mode trunk
 switchport trunk allowed vlan 2
```

---

#### **Switch C**
```bash
# EtherChannel between Switch C and Switch A (Po2)
interface range GigabitEthernet1/1 - 1/2
 channel-group 2 mode passive        # LACP Passive mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel2
 switchport mode trunk
 switchport trunk allowed vlan 2

# EtherChannel between Switch C and Switch D (Po4)
interface range GigabitEthernet1/3 - 1/4
 channel-group 4 mode active         # LACP Active mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel4
 switchport mode trunk
 switchport trunk allowed vlan 2
```

---

#### **Switch D**
```bash
# EtherChannel between Switch D and Switch B (Po3)
interface range GigabitEthernet1/1 - 1/2
 channel-group 3 mode passive        # LACP Passive mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel3
 switchport mode trunk
 switchport trunk allowed vlan 2

# EtherChannel between Switch D and Switch C (Po4)
interface range GigabitEthernet1/3 - 1/4
 channel-group 4 mode passive        # LACP Passive mode
 switchport mode trunk
 switchport trunk allowed vlan 2

interface Port-channel4
 switchport mode trunk
 switchport trunk allowed vlan 2
```

---

### **Explanation of Commands**
1. **LACP Modes**:
   - **Active**: Actively negotiates the EtherChannel with the other side.
   - **Passive**: Waits for the other side to initiate the negotiation.

2. **Trunk Configuration**:
   - Set interfaces to **trunk mode** and allow only **VLAN 2**.

3. **Port-Channel**:
   - The `Port-channel` interface is the logical representation of the EtherChannel bundle.

4. **Channel Groups**:
   - `channel-group <number>`: Groups the physical interfaces into a single logical interface.
   - Each switch pair uses a unique group number.

---

### **Verification Commands**
Use these commands to verify the EtherChannel configuration:

1. **Check EtherChannel Summary**:
   ```bash
   show etherchannel summary
   ```

2. **Verify Trunk Configuration**:
   ```bash
   show interfaces trunk
   ```

3. **Check Port-Channel Status**:
   ```bash
   show interfaces port-channel <number>
   ```

4. **View LACP Neighbor Status**:
   ```bash
   show lacp neighbor
   ```

---

### **Logical Diagram**
```
+----------------+                     +----------------+
|   Switch A     |---------------------|   Switch B     |
|  Po1 (LACP)    |                     |  Po1 (LACP)    |
|                |                     |                |
|  Po2 (LACP)    |---------------------|  Po3 (LACP)    |
|                |                     |                |
+----------------+                     +----------------+
       ||                                     ||
       ||                                     ||
       \/                                     \/
+----------------+                     +----------------+
|   Switch C     |---------------------|   Switch D     |
|  Po2 (LACP)    |                     |  Po3 (LACP)    |
|                |                     |                |
|  Po4 (LACP)    |---------------------|  Po4 (LACP)    |
+----------------+                     +----------------+
```

This configuration ensures redundancy and high availability with EtherChannel links and supports VLAN 2 across all trunk links. Let me know if you need further clarification or adjustments!
