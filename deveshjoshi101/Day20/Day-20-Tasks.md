### Day 20: Mini Project - Deploy a Multi-Tier Web Application Using Docker Compose

**Objective:** Deploy a multi-tier web application using Docker Compose, ensuring the application is secure, persistent, and scalable. Document the entire process and include security best practices.

---

#### **Project Overview**

For this mini-project, you will deploy a multi-tier web application using Docker Compose. The application will consist of:

1. **Frontend:** A web interface (e.g., Nginx).
2. **Backend:** An application server (e.g., Node.js).
3. **Database:** A persistent data store (e.g., PostgreSQL).

You will ensure the deployment is secure, the data is persistent, and the application can scale.

---

#### **1. Setup the Project Structure**

**Create a Project Directory:**

```bash
mkdir multi-tier-app
cd multi-tier-app
```

**Create a `docker-compose.yml` File:**

```yaml
version: "3.8"

services:
  frontend:
    image: nginx:latest
    container_name: frontend
    ports:
      - "80:80"
    networks:
      - app-network

  backend:
    image: node:14
    container_name: backend
    volumes:
      - ./backend:/usr/src/app
    working_dir: /usr/src/app
    command: ["npm", "start"]
    networks:
      - app-network
    environment:
      - DATABASE_URL=postgres://user:password@db:5432/mydb

  db:
    image: postgres:13
    container_name: db
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - app-network
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=mydb

networks:
  app-network:
    driver: bridge

volumes:
  db-data:
```

**Directory Structure:**

```
multi-tier-app/
├── docker-compose.yml
└── backend/
    └── (Your Node.js application files)
```

---

#### **2. Implement Security Best Practices**

**1. Use Non-Root Users:**

Update your Dockerfiles to use non-root users where possible.

**2. Secrets Management:**

Store sensitive data (e.g., database credentials) securely. Use Docker secrets in Swarm mode or environment variables in Compose files for simplicity.

**3. Network Isolation:**

Ensure your containers are on a private network, and avoid exposing unnecessary ports.

**4. Regularly Update Images:**

Use official and up-to-date images for better security.

**5. Limit Container Capabilities:**

Minimize container privileges with appropriate Docker options.

---

#### **3. Deploy and Test the Application**

**1. Start the Docker Compose Application:**

```bash
docker-compose up -d
```

**2. Verify the Deployment:**

- **Check the Status of Containers:**

  ```bash
  docker-compose ps
  ```

- **Inspect Logs:**

  ```bash
  docker-compose logs
  ```

- **Access the Frontend:**
  - Open a browser and go to `http://localhost` to ensure the frontend is working.

**3. Scaling the Application:**

**Scale Backend Service:**

```bash
docker-compose up -d --scale backend=3
```

**Verify the Scaled Services:**

```bash
docker-compose ps
```

---

#### **4. Implement Persistence and Scalability**

**Data Persistence:**

- **Database Data:** Ensure database data persists by using Docker volumes (`db-data` in the `docker-compose.yml` file).

**Scaling Services:**

- **Scale Frontend and Backend:** Use Docker Compose's scaling features to handle more traffic or processing.

---

#### **5. Document the Process**

**Documentation:**

1. **Project Structure:**

   - Describe the directory structure and purpose of each component in the `docker-compose.yml`.

2. **Security Best Practices:**

   - Document the security measures implemented (e.g., non-root users, secrets management).

3. **Deployment Steps:**

   - Provide clear instructions on how to start, stop, and manage the Docker Compose setup.

4. **Testing and Verification:**

   - Explain how to verify that the application is running correctly and how to test its functionality.

5. **Scaling:**
   - Describe how to scale the services and the expected behavior.

---

### **Example Documentation**

**1. Project Structure:**

- **`docker-compose.yml`:** Defines services for frontend, backend, and database with networks and volumes.
- **`backend/`:** Contains the Node.js application files.

**2. Security Best Practices:**

- **Non-Root Users:** Use non-root users in Dockerfiles.
- **Secrets Management:** Use environment variables for credentials.
- **Network Isolation:** All services are on a private `app-network`.
- **Regular Updates:** Use latest official images.
- **Container Capabilities:** Limit privileges using Docker options.

**3. Deployment Steps:**

1. **Start the Application:**

   ```bash
   docker-compose up -d
   ```

2. **Verify the Deployment:**

   ```bash
   docker-compose ps
   docker-compose logs
   ```

3. **Access Frontend:**
   - Visit `http://localhost` in a browser.

**4. Scaling:**

- **Scale Backend Service:**

  ```bash
  docker-compose up -d --scale backend=3
  ```

- **Verify Scaled Services:**

  ```bash
  docker-compose ps
  ```

---
