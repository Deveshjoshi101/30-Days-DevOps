### Day 15: Introduction to Docker

**Objective:** Learn the basics of Docker and containerization, install Docker, and practice basic Docker commands and container management.

---

#### **1. Learn About Docker and Containerization Concepts**

**Docker Overview:**

- **Docker** is an open-source platform that automates the deployment, scaling, and management of applications using containerization.
- **Containers** encapsulate an application and its dependencies into a single package that can run consistently across various environments.

**Key Concepts:**

- **Container:** A lightweight, standalone, executable package of software that includes everything needed to run an application (code, runtime, system tools, libraries, and settings).
- **Image:** A read-only template used to create containers. It includes the application code, libraries, dependencies, and other files needed to run the application.
- **Docker Engine:** The runtime that manages containers and images on your system.
- **Docker Hub:** A cloud-based registry service for sharing and managing Docker images.

**Benefits of Containerization:**

- **Consistency:** Ensures the application runs the same in development, testing, and production environments.
- **Isolation:** Provides isolated environments for applications, preventing conflicts between them.
- **Portability:** Enables applications to run on any system that has Docker installed.

---

#### **2. Install Docker on Your System**

**For Ubuntu/Debian:**

1. **Update Package Index:**

   ```bash
   sudo apt update
   ```

2. **Install Required Packages:**

   ```bash
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   ```

3. **Add Docker’s Official GPG Key:**

   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   ```

4. **Add Docker Repository:**

   ```bash
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   ```

5. **Update Package Index Again:**

   ```bash
   sudo apt update
   ```

6. **Install Docker CE (Community Edition):**

   ```bash
   sudo apt install -y docker-ce
   ```

7. **Verify Docker Installation:**

   ```bash
   sudo systemctl status docker
   ```

**For other distributions or operating systems:**

- Follow the installation instructions from the [official Docker documentation](https://docs.docker.com/get-docker/).

---

#### **3. Pull and Run a Basic Docker Container (e.g., Nginx)**

**Pull the Nginx Image:**

```bash
sudo docker pull nginx
```

**Run the Nginx Container:**

```bash
sudo docker run -d -p 80:80 nginx
```

- **Explanation:**
  - `-d` runs the container in detached mode.
  - `-p 80:80` maps port 80 on the host to port 80 in the container.

**Verify the Container is Running:**

- Open a web browser and navigate to `http://localhost`. You should see the default Nginx welcome page.

---

#### **4. Learn About Docker Images and How to Manage Them**

**List Docker Images:**

```bash
sudo docker images
```

**Remove a Docker Image:**

```bash
sudo docker rmi <image_id>
```

- **Note:** You need to stop any running containers using the image before removing it.

**View Detailed Information About an Image:**

```bash
sudo docker inspect <image_id>
```

**Tag an Image (for versioning or renaming):**

```bash
sudo docker tag <image_id> <repository>:<tag>
```

---

#### **5. Explore and Practice Using Docker Commands**

**Basic Docker Commands:**

- **Run a Container:**

  ```bash
  sudo docker run [OPTIONS] <image>
  ```

- **List Running Containers:**

  ```bash
  sudo docker ps
  ```

- **List All Containers (including stopped ones):**

  ```bash
  sudo docker ps -a
  ```

- **Stop a Running Container:**

  ```bash
  sudo docker stop <container_id>
  ```

- **Remove a Container:**

  ```bash
  sudo docker rm <container_id>
  ```

- **View Container Logs:**

  ```bash
  sudo docker logs <container_id>
  ```

---

### **Practice Exercises**

1. **Install Docker on your local machine and verify the installation.**
2. **Pull and run different Docker images (e.g., `hello-world`, `alpine`).**
3. **Experiment with basic Docker commands to manage containers and images.**
4. **Create and run a Docker container that runs a simple web server (e.g., `nginx`, `httpd`).**

---

### **Documentation**

**Document the Following:**

- **Installation Steps:** Detail the installation process for Docker on your system.
- **Basic Docker Commands:** List and describe the Docker commands used and their purpose.
- **Container Management:** Describe how to pull, run, stop, and remove containers.
- **Image Management:** Explain how to manage Docker images, including listing, tagging, and removing images.

---
