### Day 28: CI/CD with Jenkins and Kubernetes

**Objective:** Integrate Jenkins with Kubernetes to automate deployments, write pipelines to handle Docker images, monitor Kubernetes clusters, implement advanced deployment strategies, and use Helm for application management.

---

#### **1. Integrate Jenkins with Kubernetes for Automated Deployments**

**Steps to Integrate:**

- **Install Jenkins Kubernetes Plugin:** This plugin allows Jenkins to dynamically provision Kubernetes agents (pods) to execute build jobs.

**Installation:**

1. Go to Jenkins Dashboard → Manage Jenkins → Manage Plugins.
2. Search for "Kubernetes" and install the "Kubernetes" plugin.
3. Restart Jenkins.

**Configure Kubernetes Cloud:**

1. Go to Jenkins Dashboard → Manage Jenkins → Manage Nodes and Clouds → Configure Clouds → Add a new cloud → Kubernetes.
2. Configure the Kubernetes cluster URL and Jenkins credentials.
3. Set up pod templates for Jenkins agents.

**Resources:**

- [Jenkins Kubernetes Plugin](https://plugins.jenkins.io/kubernetes/)
- [Configuring Kubernetes Cloud](https://plugins.jenkins.io/kubernetes/#configuring-the-plugin)

---

#### **2. Write a Jenkins Pipeline That Builds, Tests, and Deploys a Docker Image to Kubernetes**

**Pipeline Example:**

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('my-app')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image('my-app').inside {
                        sh 'pytest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('my-app').push('latest')
                    }
                }
                kubernetesDeploy(
                    configs: 'kubernetes/deployment.yaml',
                    kubeconfigId: 'kubeconfig'
                )
            }
        }
    }
}
```

**Resources:**

- [Jenkins Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Kubernetes Plugin for Jenkins](https://plugins.jenkins.io/kubernetes/)

---

#### **3. Set Up Jenkins to Monitor the Kubernetes Cluster**

**Steps to Monitor:**

- **Install Monitoring Plugins:** Use plugins like Prometheus, Grafana, or Kubernetes Dashboard Plugin for Jenkins.

**Example Monitoring Setup:**

1. Install the "Prometheus" plugin on Jenkins.
2. Configure Prometheus to scrape Jenkins metrics.
3. Set up a Grafana dashboard to visualize Jenkins metrics and Kubernetes cluster health.

**Resources:**

- [Prometheus Plugin for Jenkins](https://plugins.jenkins.io/prometheus/)
- [Grafana for Jenkins Monitoring](https://grafana.com/docs/grafana/latest/getting-started/getting-started-jenkins/)

---

#### **4. Implement Blue-Green or Canary Deployments Using Jenkins and Kubernetes**

**Blue-Green Deployment:**

- **Concept:** Deploy new versions alongside the old version. Switch traffic to the new version once it's confirmed to be working.

**Example Deployment Strategy:**

1. **Deploy New Version:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-blue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
      version: blue
  template:
    metadata:
      labels:
        app: my-app
        version: blue
    spec:
      containers:
        - name: my-container
          image: my-app:latest
```

2. **Switch Traffic:**

Update your Service to point to the new version by changing the label selector.

**Canary Deployment:**

- **Concept:** Gradually roll out changes to a subset of users before a full release.

**Example Deployment Strategy:**

1. **Initial Canary Release:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-canary
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
      version: canary
  template:
    metadata:
      labels:
        app: my-app
        version: canary
    spec:
      containers:
        - name: my-container
          image: my-app:latest
```

2. **Gradual Rollout:**

Increase the number of replicas as you validate the canary deployment's stability.

**Resources:**

- [Blue-Green Deployment Strategy](https://www.redhat.com/en/topics/devops/what-is-blue-green-deployment)
- [Canary Releases](https://martinfowler.com/bliki/CanaryRelease.html)

---

#### **5. Learn About and Set Up Helm to Manage Kubernetes Applications**

**Helm Basics:**

- **Purpose:** Helm is a package manager for Kubernetes, simplifying the deployment and management of applications.

**Steps to Set Up Helm:**

1. **Install Helm:**

   ```sh
   curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```

2. **Add Helm Repository:**

   ```sh
   helm repo add stable https://charts.helm.sh/stable
   ```

3. **Install a Chart:**

   ```sh
   helm install my-release stable/nginx
   ```

4. **Manage Releases:**

   ```sh
   helm list
   helm upgrade my-release stable/nginx
   helm uninstall my-release
   ```

**Resources:**

- [Helm Documentation](https://helm.sh/docs/)
- [Helm Charts](https://artifacthub.io/)

---

### **Documentation**

**Document the Following:**

- **Jenkins-Kubernetes Integration:**

  - Configuration steps and benefits.

- **Jenkins Pipeline:**

  - Example pipeline script and explanations of each stage.

- **Cluster Monitoring:**

  - Tools and setup process for monitoring Jenkins and Kubernetes.

- **Deployment Strategies:**

  - Blue-Green and Canary deployment examples and how they are implemented.

- **Helm Setup:**
  - Installation steps, basic commands, and example usage of Helm charts.

---
