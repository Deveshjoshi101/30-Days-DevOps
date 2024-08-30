### Day 18: Docker Networking

**Objective:** Understand Docker networking concepts, create and manage Docker networks, connect containers across multiple networks, practice using different types of networks, and explore Docker networking tools.

---

#### **1. Learn About Docker Networking Concepts**

**Docker Networking Overview:**

- **Docker Networking** allows containers to communicate with each other and with external networks.
- **Networking Types:**
  - **Bridge Network:** Default network driver for Docker containers, providing isolation and communication within the same host.
  - **Host Network:** Shares the host’s network stack with the container, bypassing Docker’s network isolation.
  - **Overlay Network:** Used for multi-host networking, allowing containers on different Docker hosts to communicate.
  - **Macvlan Network:** Allows containers to have their own MAC address, useful for integrating with legacy applications or network appliances.
  - **None Network:** Disables all networking for the container.

**Key Concepts:**

- **Network Drivers:** Determine how containers connect to each other and to the outside world.
- **IP Addressing:** Containers can get IP addresses from the network they are connected to.
- **Port Mapping:** Maps container ports to host ports to expose services.

---

#### **2. Create and Manage Docker Networks**

**Create a Bridge Network:**

```bash
sudo docker network create my-bridge-network
```

**List Docker Networks:**

```bash
sudo docker network ls
```

**Inspect a Docker Network:**

```bash
sudo docker network inspect my-bridge-network
```

**Remove a Docker Network:**

```bash
sudo docker network rm my-bridge-network
```

**Example Workflow:**

1. **Create a network:**

   ```bash
   sudo docker network create my-bridge-network
   ```

2. **List networks:**

   ```bash
   sudo docker network ls
   ```

3. **Inspect the created network:**

   ```bash
   sudo docker network inspect my-bridge-network
   ```

4. **Remove the network:**

   ```bash
   sudo docker network rm my-bridge-network
   ```

---

#### **3. Connect Containers Across Multiple Networks**

**Example:**

1. **Create Two Networks:**

   ```bash
   sudo docker network create network1
   sudo docker network create network2
   ```

2. **Run Two Containers and Connect Each to Both Networks:**

   ```bash
   sudo docker run -d --name container1 --network network1 --network network2 nginx
   sudo docker run -d --name container2 --network network1 --network network2 alpine sleep 3600
   ```

3. **Verify Connectivity:**

   - **Access the Shell of `container2`:**

     ```bash
     sudo docker exec -it container2 /bin/sh
     ```

   - **Ping `container1` from `container2`:**

     ```sh
     ping container1
     ```

**Example Workflow:**

1. **Create multiple networks:**

   ```bash
   sudo docker network create network1
   sudo docker network create network2
   ```

2. **Run containers connected to multiple networks:**

   ```bash
   sudo docker run -d --name container1 --network network1 --network network2 nginx
   sudo docker run -d --name container2 --network network1 --network network2 alpine sleep 3600
   ```

3. **Verify connectivity between containers:**

   ```bash
   sudo docker exec -it container2 /bin/sh
   ping container1
   ```

---

#### **4. Practice Using Bridge and Overlay Networks**

**Create a Bridge Network:**

```bash
sudo docker network create --driver bridge my-bridge
```

**Create an Overlay Network:**

- Ensure you have Docker Swarm mode enabled to use overlay networks:

  ```bash
  sudo docker swarm init
  ```

- Create the overlay network:

  ```bash
  sudo docker network create --driver overlay my-overlay
  ```

**Example Workflow:**

1. **Create a bridge network:**

   ```bash
   sudo docker network create --driver bridge my-bridge
   ```

2. **Run a container on the bridge network:**

   ```bash
   sudo docker run -d --name bridge-container --network my-bridge nginx
   ```

3. **Create an overlay network:**

   ```bash
   sudo docker network create --driver overlay my-overlay
   ```

4. **Create a service using the overlay network:**

   ```bash
   sudo docker service create --name overlay-service --network my-overlay nginx
   ```

---

#### **5. Explore Docker Networking Tools**

**List Docker Networks:**

```bash
sudo docker network ls
```

- Displays a list of all Docker networks on the system.

**Inspect a Docker Network:**

```bash
sudo docker network inspect <network_name>
```

- Provides detailed information about a specific network, including connected containers and network configuration.

**Inspect a Container’s Network Configuration:**

```bash
sudo docker inspect <container_name> --format='{{json .NetworkSettings.Networks}}'
```

**Example Workflow:**

1. **List all networks:**

   ```bash
   sudo docker network ls
   ```

2. **Inspect a specific network:**

   ```bash
   sudo docker network inspect my-bridge
   ```

3. **Inspect a container’s network configuration:**

   ```bash
   sudo docker inspect container1 --format='{{json .NetworkSettings.Networks}}'
   ```

---

### **Documentation**

**Document the Following:**

- **Docker Networking Concepts:**

  - Explain the different types of Docker networks and their use cases.

- **Network Management:**

  - Include commands for creating, listing, inspecting, and removing Docker networks.

- **Connecting Containers:**

  - Provide examples of connecting containers across multiple networks.

- **Network Types:**

  - Document bridge and overlay networks with examples.

- **Networking Tools:**
  - List Docker networking commands and their usage.

---
