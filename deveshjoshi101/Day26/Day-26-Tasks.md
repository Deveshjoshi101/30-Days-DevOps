### Day 26: Advanced Kubernetes

**Objective:** Explore advanced Kubernetes features such as Deployments, StatefulSets, persistent storage, ConfigMaps and Secrets, Ingress resources, and scaling applications.

---

#### **1. Learn About and Create Kubernetes Deployments and StatefulSets**

**Deployments:**

- **Purpose:** Manage stateless applications. Ensure that the desired number of pod replicas are running and handle updates and rollbacks.

**Example Deployment YAML:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
          ports:
            - containerPort: 80
```

**StatefulSets:**

- **Purpose:** Manage stateful applications with stable, unique network identifiers and persistent storage.

**Example StatefulSet YAML:**

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
spec:
  serviceName: "my-service"
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
          ports:
            - containerPort: 80
  volumeClaimTemplates:
    - metadata:
        name: my-persistent-storage
      spec:
        accessModes: ["ReadWriteOnce"]
        resources:
          requests:
            storage: 1Gi
```

**Resources:**

- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Kubernetes StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

---

#### **2. Implement Persistent Storage Using Persistent Volumes (PVs) and Persistent Volume Claims (PVCs)**

**Persistent Volumes (PVs):**

- **Purpose:** Provide a way to manage storage resources in the cluster.

**Example PV YAML:**

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
```

**Persistent Volume Claims (PVCs):**

- **Purpose:** Request storage resources from the cluster.

**Example PVC YAML:**

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

**Resources:**

- [Kubernetes Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
- [Kubernetes Persistent Volume Claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)

---

#### **3. Set Up and Manage ConfigMaps and Secrets**

**ConfigMaps:**

- **Purpose:** Store configuration data in key-value pairs.

**Example ConfigMap YAML:**

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  config.properties: |
    key1=value1
    key2=value2
```

**Secrets:**

- **Purpose:** Store sensitive data like passwords or tokens.

**Example Secret YAML:**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: dXNlcg== # base64 encoded "user"
  password: cGFzc3dvcmQ= # base64 encoded "password"
```

**Resources:**

- [Kubernetes ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)
- [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

---

#### **4. Explore Kubernetes Ingress and Create an Ingress Resource**

**Ingress:**

- **Purpose:** Manage external access to services in the cluster, typically HTTP.

**Example Ingress YAML:**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  rules:
    - host: my-app.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-service
                port:
                  number: 80
```

**Resources:**

- [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

---

#### **5. Practice Scaling Applications Using Kubernetes**

**Scaling Deployments:**

- **Purpose:** Adjust the number of replicas for your application.

**Commands:**

- **Scale Up:**

  ```sh
  kubectl scale deployment my-deployment --replicas=5
  ```

- **Scale Down:**
  ```sh
  kubectl scale deployment my-deployment --replicas=2
  ```

**Resources:**

- [Scaling Applications](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)

---

### **Documentation**

**Document the Following:**

- **Deployments and StatefulSets:**

  - Definitions, YAML examples, and use cases.

- **Persistent Storage:**

  - PVs and PVCs definitions, YAML examples, and their role in Kubernetes.

- **ConfigMaps and Secrets:**

  - Definitions, YAML examples, and how to use them in applications.

- **Ingress:**

  - Definition, YAML example, and use cases for managing external access.

- **Scaling Applications:**
  - Methods for scaling applications and the impact on resource management.

---
