### Day 16: Working with Docker Containers

**Objective:** Learn how to create and use Dockerfiles, build and run custom Docker images, manage Docker containers, use Docker volumes for data persistence, and network multiple containers together.

---

#### **1. Learn About and Create Dockerfiles**

**Dockerfile Overview:**

- **Dockerfile** is a text file that contains a set of instructions for building a Docker image. It defines the base image, environment variables, file additions, and commands to run within the container.

**Basic Dockerfile Example:**

```Dockerfile
# Use an official base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y \
    nginx \
    curl

# Add files to the image
COPY index.html /var/www/html/index.html

# Expose ports
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
```

**Explanation:**

- `FROM` specifies the base image.
- `RUN` executes commands during image build.
- `COPY` copies files from the host to the container.
- `EXPOSE` indicates the port the container will listen on.
- `CMD` sets the default command to run when the container starts.

**Create a Dockerfile:**

1. Create a directory for your Dockerfile and other necessary files:

   ```bash
   mkdir my-docker-app
   cd my-docker-app
   ```

2. Create and edit a `Dockerfile` using a text editor.

   ```bash
   nano Dockerfile
   ```

3. Add the content of your Dockerfile (see example above).

4. Create an `index.html` file if needed.

   ```html
   <html>
     <body>
       <h1>Hello, Docker!</h1>
     </body>
   </html>
   ```

---

#### **2. Build and Run a Custom Docker Image**

**Build the Docker Image:**

```bash
sudo docker build -t my-custom-image .
```

- `-t` tags the image with a name (`my-custom-image`).

**Run the Docker Image:**

```bash
sudo docker run -d -p 8080:80 my-custom-image
```

- `-d` runs the container in detached mode.
- `-p 8080:80` maps port 80 in the container to port 8080 on the host.

**Verify the Container:**

- Open a web browser and navigate to `http://localhost:8080`. You should see the content served by the Nginx container.

---

#### **3. Practice Managing Containers**

**Start a Stopped Container:**

```bash
sudo docker start <container_id>
```

**Stop a Running Container:**

```bash
sudo docker stop <container_id>
```

**Restart a Container:**

```bash
sudo docker restart <container_id>
```

**List Running Containers:**

```bash
sudo docker ps
```

**List All Containers:**

```bash
sudo docker ps -a
```

**Remove a Container:**

```bash
sudo docker rm <container_id>
```

**Example Workflow:**

1. **Run a container:**

   ```bash
   sudo docker run -d --name my-container nginx
   ```

2. **Stop the container:**

   ```bash
   sudo docker stop my-container
   ```

3. **Restart the container:**

   ```bash
   sudo docker restart my-container
   ```

4. **Remove the container:**

   ```bash
   sudo docker rm my-container
   ```

---

#### **4. Use Docker Volumes to Persist Data**

**Create a Docker Volume:**

```bash
sudo docker volume create my-volume
```

**Run a Container with a Volume:**

```bash
sudo docker run -d -v my-volume:/data --name my-data-container ubuntu
```

**Access the Volume Data:**

- Execute a shell in the container:

  ```bash
  sudo docker exec -it my-data-container /bin/bash
  ```

- Navigate to the `/data` directory inside the container and check the files.

**Remove a Docker Volume:**

```bash
sudo docker volume rm my-volume
```

**Example Workflow:**

1. **Create a volume:**

   ```bash
   sudo docker volume create my-volume
   ```

2. **Run a container with the volume:**

   ```bash
   sudo docker run -d -v my-volume:/data --name my-data-container ubuntu
   ```

3. **Inspect the volume:**

   ```bash
   sudo docker volume inspect my-volume
   ```

---

#### **5. Network Multiple Containers Together**

**Create a Docker Network:**

```bash
sudo docker network create my-network
```

**Run Multiple Containers on the Same Network:**

1. **Run the first container:**

   ```bash
   sudo docker run -d --name web --network my-network nginx
   ```

2. **Run the second container (e.g., a simple app):**

   ```bash
   sudo docker run -d --name app --network my-network alpine sleep 3600
   ```

**Verify Network Communication:**

1. **Access a shell in the `app` container:**

   ```bash
   sudo docker exec -it app /bin/sh
   ```

2. **Ping the `web` container from `app`:**

   ```sh
   ping web
   ```

**Remove Docker Network:**

```bash
sudo docker network rm my-network
```

**Example Workflow:**

1. **Create a network:**

   ```bash
   sudo docker network create my-network
   ```

2. **Run containers on the network:**

   ```bash
   sudo docker run -d --name web --network my-network nginx
   sudo docker run -d --name app --network my-network alpine sleep 3600
   ```

3. **Verify network connectivity between containers:**

   ```bash
   sudo docker exec -it app /bin/sh
   ping web
   ```

---

### **Documentation**

**Document the Following:**

- **Dockerfile Creation:**

  - Include the Dockerfile content and explain each instruction.
  - Describe how to build and run the custom Docker image.

- **Container Management:**

  - Provide commands and examples for starting, stopping, restarting, and removing containers.

- **Docker Volumes:**

  - Explain the use of volumes for persisting data, creating, and managing volumes.

- **Networking Containers:**
  - Detail the creation of Docker networks and how to run containers on the same network to enable communication.

---
