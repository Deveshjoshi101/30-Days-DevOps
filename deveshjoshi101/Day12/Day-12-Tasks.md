### Day 12: Linux Networking Basics

#### **Task 1: Learn About IP Addressing and Subnetting**

**Objective:** Understand the fundamentals of IP addressing and subnetting to effectively manage and configure network settings.

**Key Concepts:**

- **IP Address:** A unique identifier for a device on a network.

  - **IPv4 Address:** Consists of four octets (e.g., `192.168.1.1`).
  - **IPv6 Address:** Consists of eight groups of four hexadecimal digits (e.g., `2001:db8::ff00:42:8329`).

- **Subnetting:** Dividing an IP address space into smaller, manageable subnets.
  - **Subnet Mask:** Defines the network and host portions of an IP address (e.g., `255.255.255.0`).
  - **CIDR Notation:** Provides a shorthand for subnet masks (e.g., `192.168.1.0/24`).

**Calculations:**

- **Subnet Calculation:** Determine the number of subnets and hosts per subnet based on the subnet mask.
- **Network Address:** The first address in a subnet.
- **Broadcast Address:** The last address in a subnet, used for broadcasting messages.

**Outcome:** Ability to understand and calculate IP addresses and subnet configurations, essential for network design and management.

---

#### **Task 2: Configure Network Interfaces Using `ifconfig` or `ip`**

**Objective:** Learn how to configure network interfaces using traditional (`ifconfig`) and modern (`ip`) tools.

**Using `ifconfig`:**

1. **View Network Interfaces:**

   ```bash
   ifconfig
   ```

2. **Assign an IP Address:**

   ```bash
   sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0
   ```

3. **Bring Interface Up/Down:**
   ```bash
   sudo ifconfig eth0 up
   sudo ifconfig eth0 down
   ```

**Using `ip`:**

1. **View Network Interfaces:**

   ```bash
   ip addr show
   ```

2. **Assign an IP Address:**

   ```bash
   sudo ip addr add 192.168.1.100/24 dev eth0
   ```

3. **Bring Interface Up/Down:**
   ```bash
   sudo ip link set eth0 up
   sudo ip link set eth0 down
   ```

**Outcome:** Proficiency in configuring network interfaces using both traditional and modern tools.

---

#### **Task 3: Practice Using Networking Tools Like `ping`, `traceroute`, and `netstat`**

**Objective:** Gain practical experience with common networking tools to diagnose and troubleshoot network issues.

**Commands:**

1. **`ping`:** Test connectivity to a remote host.

   ```bash
   ping google.com
   ```

   - Press `Ctrl+C` to stop the ping process.

2. **`traceroute`:** Trace the path packets take to a remote host.

   ```bash
   traceroute google.com
   ```

3. **`netstat`:** Display network connections, routing tables, and interface statistics.
   ```bash
   netstat -tuln    # Show listening ports
   netstat -r       # Show routing table
   ```

**Outcome:** Ability to use networking tools to diagnose network connectivity and performance issues.

---

#### **Task 4: Set Up and Configure a Basic Firewall Using `ufw` or `iptables`**

**Objective:** Learn to configure a firewall to control network traffic and enhance system security.

**Using `ufw` (Uncomplicated Firewall):**

1. **Enable UFW:**

   ```bash
   sudo ufw enable
   ```

2. **Allow/deny Specific Ports:**

   ```bash
   sudo ufw allow 22/tcp     # Allow SSH
   sudo ufw deny 80/tcp      # Deny HTTP
   ```

3. **Check Firewall Status:**
   ```bash
   sudo ufw status
   ```

**Using `iptables`:**

1. **View Existing Rules:**

   ```bash
   sudo iptables -L
   ```

2. **Add Rules:**

   ```bash
   sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT    # Allow SSH
   sudo iptables -A INPUT -p tcp --dport 80 -j DROP      # Deny HTTP
   ```

3. **Save and Restore Rules:**
   - **Save Rules:**
     ```bash
     sudo iptables-save > /etc/iptables/rules.v4
     ```
   - **Restore Rules:**
     ```bash
     sudo iptables-restore < /etc/iptables/rules.v4
     ```

**Outcome:** Ability to set up and configure basic firewall rules to manage and secure network traffic.

---

#### **Task 5: Write a Script to Automate Network Configuration**

**Objective:** Create a script to automate network interface configuration and management tasks.

**Script Implementation:**

```bash
#!/bin/bash

# Define network interface and IP address
INTERFACE="eth0"
IP_ADDRESS="192.168.1.100/24"
GATEWAY="192.168.1.1"

# Configure the network interface
echo "Configuring network interface $INTERFACE..."

# Assign IP address
sudo ip addr add $IP_ADDRESS dev $INTERFACE

# Bring the interface up
sudo ip link set $INTERFACE up

# Set the default gateway
sudo ip route add default via $GATEWAY

echo "Network configuration applied successfully."
```

- **Explanation:**
  - Assigns an IP address and brings up the network interface.
  - Sets the default gateway for routing traffic.

**Outcome:** Automation of network configuration tasks, simplifying network setup and management.

---
