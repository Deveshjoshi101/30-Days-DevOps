### Day 30: Final Project - Detailed Guide

**Objective:** Build and deploy a fully automated CI/CD pipeline using Jenkins and Kubernetes. The pipeline will handle building a Docker image, running automated tests, deploying the application to a Kubernetes cluster, and implementing monitoring and logging. This guide includes all required scripts, software details, and instructions to replicate the setup.

---

#### **1. Prerequisites**

**Software:**

- **Jenkins**: CI/CD tool
- **Docker**: Containerization platform
- **Kubernetes**: Container orchestration
- **Helm**: Kubernetes package manager
- **Prometheus & Grafana**: Monitoring
- **Fluentd**: Logging

**Tools and Configurations:**

- **Git**: Version control
- **Minikube** or a cloud Kubernetes cluster (e.g., GKE, EKS, AKS)
- **kubectl**: Kubernetes command-line tool
- **Helm**: Kubernetes package manager

---

#### **2. Setup Jenkins**

**2.1 Install Jenkins:**

1. **Install Jenkins using Docker:**

   ```sh
   docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
   ```

2. **Access Jenkins:**
   Open `http://localhost:8080` in your browser.

3. **Unlock Jenkins:**
   Retrieve the unlock key:

   ```sh
   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```

   Paste the key into the Jenkins setup wizard.

4. **Install Recommended Plugins:**
   Follow the setup wizard to install the recommended plugins.

5. **Create Admin User:**
   Complete the setup by creating an admin user.

**2.2 Configure Jenkins:**

1. **Install Necessary Plugins:**

   - Go to **Manage Jenkins** → **Manage Plugins**.
   - Install the following plugins:
     - **Docker Pipeline**
     - **Kubernetes CI Plugin**
     - **Git Plugin**
     - **Pipeline Plugin**
     - **Blue Ocean**

2. **Configure Jenkins to Use Docker:**

   - **Manage Jenkins** → **Manage Nodes and Clouds** → **Configure Clouds**.
   - Add a new cloud and select Docker.

3. **Set Up Credentials:**
   - **Manage Jenkins** → **Manage Credentials**.
   - Add credentials for DockerHub, GitHub, and Kubernetes.

---

#### **3. Build and Test Docker Image**

**3.1 Create a Dockerfile:**

1. **Create a `Dockerfile` for your application:**

   ```Dockerfile
   # Use an official Node.js runtime as a parent image
   FROM node:14

   # Set the working directory
   WORKDIR /app

   # Copy package.json and package-lock.json
   COPY package*.json ./

   # Install dependencies
   RUN npm install

   # Copy the rest of the application code
   COPY . .

   # Expose port
   EXPOSE 3000

   # Start the application
   CMD ["npm", "start"]
   ```

**3.2 Create a Jenkins Pipeline Job:**

1. **Create a new pipeline job in Jenkins:**

   - Go to **New Item** → **Pipeline**.
   - Name your job (e.g., `ci-cd-pipeline`).

2. **Configure the Pipeline Script:**

   ```groovy
   pipeline {
       agent any

       stages {
           stage('Checkout') {
               steps {
                   git 'https://github.com/your-repo/your-app.git'
               }
           }

           stage('Build') {
               steps {
                   script {
                       docker.build('your-app-image')
                   }
               }
           }

           stage('Test') {
               steps {
                   script {
                       docker.image('your-app-image').inside {
                           sh 'npm test'
                       }
                   }
               }
           }

           stage('Deploy') {
               steps {
                   script {
                       docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                           docker.image('your-app-image').push('latest')
                       }
                   }
               }
           }
       }

       post {
           always {
               cleanWs()
           }
       }
   }
   ```

**Note:** Replace `https://github.com/your-repo/your-app.git` with your actual Git repository URL and `dockerhub-credentials` with the ID of your DockerHub credentials.

---

#### **4. Deploy to Kubernetes**

**4.1 Create Kubernetes Deployment and Service YAML Files:**

1. **Create `deployment.yaml`:**

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: your-app
     labels:
       app: your-app
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: your-app
     template:
       metadata:
         labels:
           app: your-app
       spec:
         containers:
           - name: your-app
             image: your-app-image:latest
             ports:
               - containerPort: 3000
   ```

2. **Create `service.yaml`:**

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: your-app-service
   spec:
     selector:
       app: your-app
     ports:
       - protocol: TCP
         port: 80
         targetPort: 3000
     type: LoadBalancer
   ```

**4.2 Apply Kubernetes Configurations:**

1. **Deploy to Kubernetes:**

   ```sh
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

2. **Verify Deployment:**

   ```sh
   kubectl get pods
   kubectl get svc
   ```

---

#### **5. Implement Monitoring and Logging**

**5.1 Monitoring:**

1. **Install Prometheus and Grafana using Helm (if not already done):**

   ```sh
   helm install prometheus prometheus-community/prometheus --namespace monitoring
   helm install grafana grafana/grafana --namespace monitoring
   ```

2. **Configure Grafana to Use Prometheus:**

   - Access Grafana at `http://localhost:3000`.
   - Add Prometheus as a data source.
   - Create or import dashboards for Kubernetes monitoring.

**5.2 Logging:**

1. **Deploy Fluentd:**

   ```yaml
   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: fluentd
     namespace: kube-system
   spec:
     selector:
       matchLabels:
         name: fluentd
     template:
       metadata:
         labels:
           name: fluentd
       spec:
         containers:
           - name: fluentd
             image: fluent/fluentd:v1.12-debian-1
             volumeMounts:
               - name: config
                 mountPath: /fluentd/etc
                 subPath: fluentd.conf
               - name: varlog
                 mountPath: /var/log
         volumes:
           - name: config
             configMap:
               name: fluentd-config
           - name: varlog
             hostPath:
               path: /var/log
   ```

   Apply the Fluentd configuration:

   ```sh
   kubectl apply -f fluentd-daemonset.yaml
   ```

2. **Configure Fluentd to Send Logs to Elasticsearch or another log aggregator.**

---

### **Documentation**

1. **Document the Process:**

   - **Setup Jenkins**: Instructions for installing Jenkins, configuring plugins, and setting up the pipeline.
   - **Docker**: Detailed Dockerfile and Jenkins pipeline configuration.
   - **Kubernetes**: YAML files for deployment and services, and instructions to apply them.
   - **Monitoring and Logging**: Setup instructions for Prometheus, Grafana, and Fluentd.

2. **Include:**

   - **Screenshots**: Provide screenshots of Jenkins setup, Grafana dashboards, and Kubernetes deployments.
   - **Scripts**: Attach the complete scripts and configuration files used.
   - **Usage Instructions**: How to trigger the pipeline, check logs, and monitor the application.

---
