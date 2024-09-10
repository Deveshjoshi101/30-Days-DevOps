### Day 29: Monitoring and Logging in Kubernetes

**Objective:** Set up and configure monitoring and logging tools to track the health and performance of your Kubernetes cluster. Learn to visualize metrics, collect logs, and manage the cluster effectively.

---

#### **1. Learn About Monitoring Tools Like Prometheus and Grafana**

**Prometheus:**

- **Description:** An open-source monitoring and alerting toolkit designed for reliability and scalability. It collects metrics from configured endpoints at specified intervals and stores them in a time-series database.
- **Website:** [Prometheus](https://prometheus.io/)

**Grafana:**

- **Description:** An open-source analytics and monitoring platform. It integrates with various data sources, including Prometheus, to create dashboards and visualizations.
- **Website:** [Grafana](https://grafana.com/)

**Resources:**

- [Introduction to Prometheus](https://prometheus.io/docs/introduction/overview/)
- [Introduction to Grafana](https://grafana.com/docs/grafana/latest/getting-started/)

---

#### **2. Set Up Prometheus to Monitor Your Kubernetes Cluster**

**Steps to Install Prometheus:**

1. **Install Prometheus Using Helm:**

   ```sh
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   helm install prometheus prometheus-community/prometheus
   ```

2. **Verify Installation:**

   ```sh
   kubectl get pods -n default -l "release=prometheus"
   ```

**Configuration:**

- **Prometheus Configuration:** Prometheus uses configuration files to specify what data to scrape. Default Helm values will set up a basic configuration that monitors all the Kubernetes nodes and pods.

**Resources:**

- [Prometheus Helm Chart](https://artifacthub.io/packages/helm/prometheus-community/prometheus)

---

#### **3. Visualize Metrics Using Grafana**

**Steps to Install Grafana:**

1. **Install Grafana Using Helm:**

   ```sh
   helm install grafana grafana/grafana
   ```

2. **Access Grafana Dashboard:**

   ```sh
   kubectl port-forward svc/grafana 3000:80
   ```

   Open `http://localhost:3000` in your browser. Default username is `admin` and password is `admin`.

3. **Add Prometheus as a Data Source:**

   - Go to Grafana → Configuration → Data Sources.
   - Add Prometheus and set the URL to `http://prometheus-server`.

4. **Create Dashboards:**

   - Use pre-built dashboards available in Grafana or create your own to visualize metrics.

**Resources:**

- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [Grafana Dashboards](https://grafana.com/grafana/dashboards)

---

#### **4. Set Up and Configure Fluentd for Logging in Kubernetes**

**Steps to Install Fluentd:**

1. **Install Fluentd Using Helm:**

   ```sh
   helm repo add fluent https://fluent.github.io/helm-charts
   helm repo update
   helm install fluentd fluent/fluentd
   ```

2. **Configure Fluentd:**

   Fluentd collects logs from various sources and can forward them to different outputs (e.g., Elasticsearch, Fluentd).

   - **Edit Fluentd ConfigMap:**

     ```sh
     kubectl edit configmap fluentd-config -n kube-system
     ```

     Add your desired configurations for log collection and forwarding.

**Resources:**

- [Fluentd Documentation](https://docs.fluentd.org/)
- [Fluentd Helm Chart](https://artifacthub.io/packages/helm/fluent/fluentd)

---

#### **5. Explore and Use Kubernetes Dashboard for Cluster Management**

**Steps to Install Kubernetes Dashboard:**

1. **Install Kubernetes Dashboard:**

   ```sh
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.0/aio/deploy/recommended.yaml
   ```

2. **Access Dashboard:**

   ```sh
   kubectl proxy
   ```

   Open `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/` in your browser.

3. **Set Up Access:**

   - **Create a Service Account:**

     ```yaml
     apiVersion: v1
     kind: ServiceAccount
     metadata:
       name: admin-user
       namespace: kubernetes-dashboard
     ```

   - **Bind Role to Service Account:**

     ```yaml
     apiVersion: rbac.authorization.k8s.io/v1
     kind: ClusterRoleBinding
     metadata:
       name: admin-user
     subjects:
       - kind: ServiceAccount
         name: admin-user
         namespace: kubernetes-dashboard
     roleRef:
       kind: ClusterRole
       name: cluster-admin
       apiGroup: rbac.authorization.k8s.io
     ```

   - **Get Token:**

     ```sh
     kubectl -n kubernetes-dashboard create token admin-user
     ```

**Resources:**

- [Kubernetes Dashboard Documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [Kubernetes Dashboard Installation Guide](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

---

### **Documentation**

**Document the Following:**

- **Monitoring Tools:**

  - Overview of Prometheus and Grafana, and their roles in monitoring Kubernetes.

- **Prometheus Setup:**

  - Installation steps, verification, and basic configuration.

- **Grafana Visualization:**

  - Adding Prometheus as a data source, creating dashboards, and visualizing metrics.

- **Fluentd Configuration:**

  - Installation, configuration, and log collection setup.

- **Kubernetes Dashboard:**
  - Installation, access, and configuring user access.

---
