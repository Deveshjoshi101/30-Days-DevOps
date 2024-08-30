### Day 19: Docker Security

**Objective:** Learn best practices for securing Docker containers, explore Docker security features, implement image security scanning, configure Docker secrets, and use Docker Bench for Security.

---

#### **1. Learn About Best Practices for Securing Docker Containers**

**Best Practices for Docker Security:**

1. **Use Official Images:**

   - Prefer official or trusted images from Docker Hub or verified repositories.

2. **Minimize Container Privileges:**

   - Avoid running containers as the root user. Use non-root users wherever possible.

3. **Limit Container Capabilities:**

   - Restrict container capabilities with the `--cap-drop` and `--cap-add` options.

4. **Keep Images and Containers Up-to-Date:**

   - Regularly update your base images and rebuild your containers to include the latest security patches.

5. **Use Read-Only Filesystems:**

   - Run containers with a read-only filesystem where possible to minimize the impact of potential exploits.

6. **Limit Network Exposure:**

   - Use Docker networks to isolate containers and limit exposure of sensitive services.

7. **Monitor and Log Container Activity:**

   - Implement logging and monitoring solutions to keep track of container activity.

8. **Scan Images for Vulnerabilities:**
   - Use tools to scan your Docker images for known vulnerabilities.

---

#### **2. Explore Docker Security Features**

**User Namespaces:**

- **User namespaces** map container user IDs to different host user IDs to provide an additional layer of isolation.

**Enable User Namespaces:**

1. Edit Docker daemon configuration:

   ```bash
   sudo nano /etc/docker/daemon.json
   ```

2. Add the following configuration:

   ```json
   {
     "userns-remap": "default"
   }
   ```

3. Restart Docker:

   ```bash
   sudo systemctl restart docker
   ```

**SELinux:**

- **SELinux (Security-Enhanced Linux)** provides an additional security layer by enforcing security policies on processes and files.

**Enable SELinux:**

- Ensure SELinux is installed and set to enforcing mode:

  ```bash
  sudo setenforce 1
  ```

- Docker supports SELinux labels. You can add labels to your Docker containers and volumes:

  ```bash
  sudo docker run -it --security-opt label:type:container_runtime_t nginx
  ```

---

#### **3. Implement Security Scanning for Docker Images**

**Using Docker Scan:**

- Docker provides built-in image scanning via `docker scan`, which uses Snyk to identify vulnerabilities.

**Scan an Image:**

```bash
sudo docker scan <image_name>
```

**Using Third-Party Tools:**

- **Trivy:** A comprehensive open-source vulnerability scanner.

**Install Trivy:**

```bash
sudo apt-get install trivy
```

**Scan an Image with Trivy:**

```bash
trivy image <image_name>
```

**Example Workflow:**

1. **Scan an image with Docker Scan:**

   ```bash
   sudo docker scan nginx
   ```

2. **Scan an image with Trivy:**

   ```bash
   trivy image nginx
   ```

---

#### **4. Configure and Use Docker Secrets**

**Docker Secrets Overview:**

- **Docker Secrets** provides a way to securely manage sensitive data, such as passwords and tokens, in Docker Swarm mode.

**Create a Secret:**

1. **Create a secret from a file:**

   ```bash
   echo "my-secret-password" | docker secret create my_secret -
   ```

2. **Create a secret from a string:**

   ```bash
   docker secret create my_secret <<< "my-secret-password"
   ```

**Use Secrets in a Service:**

1. **Deploy a service using secrets:**

   ```bash
   docker service create --name my_service --secret my_secret nginx
   ```

2. **Access the secret in the container:**

   Secrets are mounted in `/run/secrets/` inside the container.

   ```bash
   cat /run/secrets/my_secret
   ```

**Example Workflow:**

1. **Create a secret:**

   ```bash
   echo "supersecret" | docker secret create my_secret -
   ```

2. **Deploy a service with the secret:**

   ```bash
   docker service create --name my_service --secret my_secret nginx
   ```

3. **Inspect the secret inside the container:**

   ```bash
   docker exec -it $(docker ps -q -f name=my_service) cat /run/secrets/my_secret
   ```

---

#### **5. Learn About Docker Bench for Security and Run It on Your Containers**

**Docker Bench for Security Overview:**

- **Docker Bench for Security** is a script that checks for common best practices and security configurations for Docker installations.

**Install Docker Bench for Security:**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/docker/docker-bench-security.git
   cd docker-bench-security
   ```

2. **Run the script:**

   ```bash
   sudo sh docker-bench-security.sh
   ```

**Example Workflow:**

1. **Clone the Docker Bench for Security repository:**

   ```bash
   git clone https://github.com/docker/docker-bench-security.git
   ```

2. **Navigate to the directory:**

   ```bash
   cd docker-bench-security
   ```

3. **Run the security checks:**

   ```bash
   sudo sh docker-bench-security.sh
   ```

4. **Review the report for recommendations and potential issues.**

---

### **Documentation**

**Document the Following:**

- **Docker Security Best Practices:**

  - List and explain best practices for securing Docker containers.

- **Security Features:**

  - Describe Docker security features such as user namespaces and SELinux.

- **Image Security Scanning:**

  - Include instructions for using `docker scan` and Trivy for vulnerability scanning.

- **Docker Secrets:**

  - Provide steps for creating and using Docker secrets.

- **Docker Bench for Security:**
  - Explain how to install and run Docker Bench for Security, and how to interpret the results.
