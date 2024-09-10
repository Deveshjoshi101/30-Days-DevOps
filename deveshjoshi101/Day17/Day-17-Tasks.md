### Day 17: Docker Compose

**Objective:** Understand Docker Compose, write a `docker-compose.yml` file to define and manage multi-container applications, and practice using Docker Compose commands.

---

#### **1. Learn About Docker Compose and Its Use Cases**

**Docker Compose Overview:**

- **Docker Compose** is a tool for defining and running multi-container Docker applications. It allows you to manage multiple containers as a single service, defining their configurations in a `docker-compose.yml` file.

**Use Cases:**

- **Multi-Container Applications:** Simplify the management of applications that require multiple services (e.g., a web server and a database).
- **Development Environments:** Set up isolated and reproducible development environments.
- **Testing and Deployment:** Easily manage and test complex application stacks.

**Key Concepts:**

- **Service:** A definition of a container and its configuration, including the image, ports, volumes, and environment variables.
- **Network:** Defines how services communicate with each other.
- **Volume:** Used to persist data and share files between containers.

---

#### **2. Write a `docker-compose.yml` File to Define a Multi-Container Application**

**Basic Example:**

Create a `docker-compose.yml` file to define a simple application with a web server and a database.

```yaml
version: "3.8"

services:
  web:
    image: nginx
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    networks:
      - webnet

  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    networks:
      - webnet

networks:
  webnet:
```

**Explanation:**

- `version`: Specifies the Compose file version.
- `services`: Defines the containers for the application.
  - `web`: A service running an Nginx container.
  - `db`: A service running a PostgreSQL container.
- `networks`: Defines a custom network for the services to communicate.

**Steps:**

1. **Create a Directory for Your Compose Project:**

   ```bash
   mkdir my-compose-app
   cd my-compose-app
   ```

2. **Create the `docker-compose.yml` File:**

   ```bash
   nano docker-compose.yml
   ```

3. **Add the Content from the Example Above and Save the File.**

4. **Create an `html` Directory and Add a Basic `index.html` File:**

   ```bash
   mkdir html
   echo "<h1>Hello from Docker Compose!</h1>" > html/index.html
   ```

---

#### **3. Practice Managing Services with Docker Compose**

**Start Services:**

```bash
sudo docker-compose up
```

- By default, this will start services in the foreground. Add `-d` to run in detached mode.

**Stop Services:**

```bash
sudo docker-compose down
```

**Restart Services:**

```bash
sudo docker-compose restart
```

**View Service Status:**

```bash
sudo docker-compose ps
```

**Example Workflow:**

1. **Start the application:**

   ```bash
   sudo docker-compose up -d
   ```

2. **Verify services are running:**

   ```bash
   sudo docker-compose ps
   ```

3. **Access the web service in a browser at `http://localhost:8080`.**

4. **Stop and remove the services:**

   ```bash
   sudo docker-compose down
   ```

---

#### **4. Use Docker Compose to Set Up a Development Environment**

**Example Development Environment:**

Create a `docker-compose.yml` file for a Node.js application with MongoDB.

```yaml
version: "3.8"

services:
  web:
    image: node:14
    working_dir: /app
    volumes:
      - ./app:/app
    ports:
      - "3000:3000"
    command: "npm start"
    depends_on:
      - mongo

  mongo:
    image: mongo
    volumes:
      - mongo-data:/data/db

volumes:
  mongo-data:
```

**Steps:**

1. **Create a Directory for the Node.js Application:**

   ```bash
   mkdir my-node-app
   cd my-node-app
   ```

2. **Create the `docker-compose.yml` File:**

   ```bash
   nano docker-compose.yml
   ```

3. **Create an `app` Directory and Add Your Node.js Application Files:**

   - Example `package.json` and `index.js`.

4. **Run the Development Environment:**

   ```bash
   sudo docker-compose up -d
   ```

5. **Access the Node.js Application at `http://localhost:3000`.**

---

#### **5. Explore Docker Compose Commands**

**Start Services in Detached Mode:**

```bash
sudo docker-compose up -d
```

**Stop and Remove Containers, Networks, and Volumes:**

```bash
sudo docker-compose down
```

**View Logs of Services:**

```bash
sudo docker-compose logs
```

**View Logs of a Specific Service:**

```bash
sudo docker-compose logs <service_name>
```

**Example Workflow:**

1. **Start the services and run in detached mode:**

   ```bash
   sudo docker-compose up -d
   ```

2. **View the logs to check for errors or status updates:**

   ```bash
   sudo docker-compose logs
   ```

3. **Stop and remove the containers:**

   ```bash
   sudo docker-compose down
   ```

---

### **Documentation**

**Document the Following:**

- **Docker Compose Overview:**

  - Explain Docker Compose and its use cases.

- **`docker-compose.yml` File:**

  - Include examples of `docker-compose.yml` files and explain the configuration.

- **Managing Services:**

  - Describe the commands to start, stop, restart, and view services.

- **Development Environment Setup:**

  - Provide an example of using Docker Compose to set up a development environment.

- **Docker Compose Commands:**
  - List and explain the commands for managing and interacting with services.

---
