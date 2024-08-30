### Day 23: Jenkins Basics

**Objective:** Understand Jenkins and CI/CD concepts, set up Jenkins, create a basic pipeline job, explore Jenkins plugins, and integrate Jenkins with a version control system.

---

#### **1. Learn About Jenkins and CI/CD Concepts**

**Jenkins Overview:**

- **Jenkins** is an open-source automation server used to automate various stages of the software development lifecycle, including build, test, and deployment.

**CI/CD Concepts:**

- **Continuous Integration (CI):** The practice of automatically building and testing code changes in a shared repository.
- **Continuous Deployment (CD):** The practice of automatically deploying code changes to production environments.

**Key Jenkins Features:**

- **Pipeline as Code:** Define your build and deployment processes as code using Jenkinsfile.
- **Plugins:** Extend Jenkins functionality with various plugins.

**Resources to Learn CI/CD:**

- [Jenkins Official Documentation](https://www.jenkins.io/doc/)
- [CI/CD Overview](https://www.redhat.com/en/topics/devops/what-is-ci-cd)

---

#### **2. Install Jenkins and Set It Up on Your System**

**Install Jenkins:**

**On Ubuntu:**

1. **Update Package List and Install Dependencies:**

   ```bash
   sudo apt update
   sudo apt install openjdk-11-jdk
   ```

2. **Add Jenkins Repository and Key:**

   ```bash
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary > /etc/apt/sources.list.d/jenkins.list'
   ```

3. **Install Jenkins:**

   ```bash
   sudo apt update
   sudo apt install jenkins
   ```

4. **Start and Enable Jenkins Service:**

   ```bash
   sudo systemctl start jenkins
   sudo systemctl enable jenkins
   ```

5. **Access Jenkins Web Interface:**

   - Open your browser and go to `http://localhost:8080`.

6. **Unlock Jenkins:**

   - Get the initial admin password from `/var/lib/jenkins/secrets/initialAdminPassword`:

     ```bash
     sudo cat /var/lib/jenkins/secrets/initialAdminPassword
     ```

   - Enter this password in the web interface to unlock Jenkins.

**Initial Setup Wizard:**

- Follow the on-screen instructions to install suggested plugins and create the first admin user.

---

#### **3. Create a Simple Pipeline Job in Jenkins**

**Create a Pipeline Job:**

1. **Log in to Jenkins Dashboard.**

2. **Create a New Job:**

   - Click on "New Item".
   - Enter a name for your job.
   - Select "Pipeline" and click "OK".

3. **Configure the Pipeline Job:**

   - **Pipeline Script:**

     ```groovy
     pipeline {
         agent any
         stages {
             stage('Build') {
                 steps {
                     echo 'Building...'
                 }
             }
             stage('Test') {
                 steps {
                     echo 'Testing...'
                 }
             }
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                 }
             }
         }
     }
     ```

   - **Save and Build:**
     - Click "Save" and then "Build Now" to run the pipeline.

---

#### **4. Learn About Jenkins Plugins and Install Essential Ones**

**Jenkins Plugins:**

- **Plugins** extend Jenkins functionality, such as integrating with version control systems, build tools, and notification systems.

**Install Plugins:**

1. **Go to "Manage Jenkins" > "Manage Plugins".**

2. **Explore Available Plugins:**

   - **Popular Plugins:** Git, GitHub Integration, Pipeline, Blue Ocean, etc.

3. **Install Plugins:**
   - Select the plugins you want and click "Install without restart" or "Download now and install after restart".

**Essential Plugins:**

- **Git Plugin:** Integrates Jenkins with Git repositories.
- **Pipeline Plugin:** Enables Jenkins Pipeline features.
- **Blue Ocean Plugin:** Provides a modern UI for Jenkins Pipelines.

---

#### **5. Integrate Jenkins with Version Control (e.g., Git)**

**Integrate Git with Jenkins:**

1. **Configure Git Plugin:**

   - Ensure the Git plugin is installed.

2. **Create a Pipeline Job with Git Integration:**

   - **Pipeline Script Example:**

     ```groovy
     pipeline {
         agent any
         stages {
             stage('Checkout') {
                 steps {
                     git url: 'https://github.com/your-repository.git', branch: 'main'
                 }
             }
             stage('Build') {
                 steps {
                     echo 'Building...'
                 }
             }
             stage('Test') {
                 steps {
                     echo 'Testing...'
                 }
             }
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                 }
             }
         }
     }
     ```

3. **Add Git Repository URL in Job Configuration:**

   - Go to the Pipeline job configuration.
   - Under "Pipeline", specify your Git repository URL and branch.

4. **Trigger Builds:**
   - **Manual Trigger:** Click "Build Now".
   - **Automated Trigger:** Configure webhooks in your Git repository to trigger builds on code changes.

---

### **Documentation**

**Document the Following:**

- **Jenkins Overview:**
  - Description of Jenkins and CI/CD concepts.
- **Installation and Setup:**

  - Installation steps for Jenkins on your system.
  - Access and initial setup instructions.

- **Pipeline Job Creation:**

  - Steps to create and configure a simple pipeline job.
  - Example Jenkinsfile.

- **Plugins:**

  - Overview of essential plugins.
  - Instructions for installing and configuring plugins.

- **Version Control Integration:**
  - How to integrate Jenkins with Git.
  - Example pipeline script for Git integration.

---
