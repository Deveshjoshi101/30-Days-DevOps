### Day 25: Introduction to Kubernetes

**Objective:** Get familiar with Kubernetes architecture, set up a local cluster using Minikube, deploy a simple application, and learn to use kubectl commands and Kubernetes services.

---

#### **1. Learn About Kubernetes Architecture and Key Concepts**

**Key Concepts:**

- **Cluster:**

  - A Kubernetes cluster consists of a set of nodes that run containerized applications.

- **Nodes:**

  - **Master Node (Control Plane):** Manages the Kubernetes cluster, including scheduling, scaling, and managing the overall cluster state.
  - **Worker Nodes:** Run the containerized applications. They include components like the Kubelet, Kube-Proxy, and container runtime.

- **Pods:**

  - The smallest deployable units in Kubernetes, encapsulating one or more containers.

- **Services:**

  - Define a logical set of Pods and a policy by which to access them. Services enable communication between Pods and external applications.

- **Deployments:**

  - Manage the deployment and scaling of Pods. They provide updates and rollbacks for applications.

- **Namespaces:**
  - Provide a way to divide cluster resources between multiple users or teams.

**Resources:**

- [Kubernetes Architecture Overview](https://kubernetes.io/docs/concepts/overview/components/)
- [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)

---

#### **2. Set Up a Local Kubernetes Cluster Using Minikube**

**Steps to Set Up Minikube:**

1. **Install Minikube:**

   - **Linux/Mac:**
     ```sh
     curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
     sudo install minikube-linux-amd64 /usr/local/bin/minikube
     ```
   - **Windows:**
     - Download the Minikube executable from the [Minikube releases page](https://github.com/kubernetes/minikube/releases) and add it to your PATH.

2. **Start Minikube:**

   ```sh
   minikube start
   ```

3. **Verify the Minikube Cluster:**
   ```sh
   kubectl cluster-info
   ```

**Resources:**

- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes CLI Reference](https://kubernetes.io/docs/reference/kubectl/overview/)

---

#### **3. Deploy a Simple Application on Kubernetes**

**Example Deployment:**

1. **Create a Deployment YAML File:**

   `nginx-deployment.yaml`

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx-deployment
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: nginx
             image: nginx:latest
             ports:
               - containerPort: 80
   ```

2. **Apply the Deployment:**

   ```sh
   kubectl apply -f nginx-deployment.yaml
   ```

3. **Verify the Deployment:**
   ```sh
   kubectl get deployments
   kubectl get pods
   ```

**Resources:**

- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Sample Deployment YAML](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)

---

#### **4. Learn About and Use kubectl Commands**

**Basic kubectl Commands:**

- **Get Cluster Information:**

  ```sh
  kubectl cluster-info
  ```

- **List All Pods:**

  ```sh
  kubectl get pods
  ```

- **Describe a Pod:**

  ```sh
  kubectl describe pod <pod-name>
  ```

- **View Logs for a Pod:**

  ```sh
  kubectl logs <pod-name>
  ```

- **Delete a Pod:**

  ```sh
  kubectl delete pod <pod-name>
  ```

- **Scale a Deployment:**
  ```sh
  kubectl scale deployment <deployment-name> --replicas=<number>
  ```

**Resources:**

- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [kubectl Commands Overview](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)

---

#### **5. Explore Kubernetes Services and Expose Your Application**

**Creating a Service to Expose the Application:**

1. **Create a Service YAML File:**

   `nginx-service.yaml`

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx-service
   spec:
     selector:
       app: nginx
     ports:
       - protocol: TCP
         port: 80
         targetPort: 80
     type: LoadBalancer
   ```

2. **Apply the Service:**

   ```sh
   kubectl apply -f nginx-service.yaml
   ```

3. **Verify the Service:**

   ```sh
   kubectl get services
   ```

4. **Access the Service:**
   - **Using Minikube:**
     ```sh
     minikube service nginx-service
     ```

**Resources:**

- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Service Types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

---

### **Documentation**

**Document the Following:**

- **Kubernetes Architecture:**

  - Overview of cluster components and key concepts.

- **Minikube Setup:**

  - Steps for installation and starting Minikube.

- **Deployment:**

  - Example YAML for deploying a simple application and commands to manage it.

- **kubectl Commands:**

  - Commonly used commands and their purposes.

- **Services:**
  - How to expose applications using Kubernetes Services and accessing them via Minikube.

---
