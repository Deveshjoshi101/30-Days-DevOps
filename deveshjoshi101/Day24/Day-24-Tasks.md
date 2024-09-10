### Day 24: Advanced Jenkins

**Objective:** Explore advanced Jenkins features including pipeline syntax, automated testing, notifications, deployment, and distributed builds.

---

#### **1. Explore Jenkins Pipeline Syntax and Write a Jenkinsfile**

**Jenkins Pipeline Syntax:**

- **Declarative Pipeline:**

  - A more structured and readable way to define your pipeline.
  - Example Jenkinsfile:

    ```groovy
    pipeline {
        agent any
        environment {
            MY_ENV_VAR = 'value'
        }
        stages {
            stage('Checkout') {
                steps {
                    git url: 'https://github.com/your-repository.git', branch: 'main'
                }
            }
            stage('Build') {
                steps {
                    echo 'Building...'
                    sh './build-script.sh'
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing...'
                    sh './test-script.sh'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying...'
                    sh './deploy-script.sh'
                }
            }
        }
        post {
            always {
                echo 'Cleaning up...'
                cleanWs()
            }
        }
    }
    ```

- **Scripted Pipeline:**

  - Provides more flexibility but requires more complex Groovy scripting.
  - Example Jenkinsfile:

    ```groovy
    node {
        stage('Checkout') {
            checkout scm
        }
        stage('Build') {
            sh './build-script.sh'
        }
        stage('Test') {
            sh './test-script.sh'
        }
        stage('Deploy') {
            sh './deploy-script.sh'
        }
        cleanWs()
    }
    ```

**Resources:**

- [Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Jenkins Pipeline Examples](https://www.jenkins.io/doc/book/pipeline/examples/)

---

#### **2. Set Up Automated Testing in a Jenkins Pipeline**

**Automated Testing Setup:**

- **Add Testing Stage:**

  ```groovy
  stage('Test') {
      steps {
          echo 'Running tests...'
          sh './run-tests.sh'
      }
  }
  ```

- **JUnit Integration:**

  ```groovy
  stage('Test') {
      steps {
          echo 'Running tests...'
          sh './run-tests.sh'
          junit '**/test-results/*.xml'
      }
  }
  ```

- **Test Reports:**
  - Ensure that your test results are in a format supported by Jenkins (e.g., JUnit XML).
  - Configure the `junit` step to publish test results.

**Resources:**

- [JUnit Plugin](https://plugins.jenkins.io/junit/)
- [Test Reports in Jenkins](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#test-results)

---

#### **3. Implement Notifications and Alerts in Jenkins**

**Notification Methods:**

- **Email Notifications:**

  - **Install Email Extension Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "Email Extension Plugin".
  - **Configure SMTP Server:**
    - Go to "Manage Jenkins" > "Configure System" > "Extended E-mail Notification".
  - **Add Email Notifications to Jenkinsfile:**

    ```groovy
    post {
        success {
            mail to: 'user@example.com',
                 subject: "Successful Build: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: "Good news! Build ${env.BUILD_NUMBER} was successful."
        }
        failure {
            mail to: 'user@example.com',
                 subject: "Failed Build: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: "Sorry, build ${env.BUILD_NUMBER} failed. Please check Jenkins for details."
        }
    }
    ```

- **Slack Notifications:**

  - **Install Slack Notification Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "Slack Notification Plugin".
  - **Configure Slack Integration:**
    - Go to "Manage Jenkins" > "Configure System" > "Slack Notifications".
  - **Add Slack Notifications to Jenkinsfile:**

    ```groovy
    post {
        success {
            slackSend(channel: '#builds', message: "Build ${env.BUILD_NUMBER} succeeded!")
        }
        failure {
            slackSend(channel: '#builds', message: "Build ${env.BUILD_NUMBER} failed.")
        }
    }
    ```

**Resources:**

- [Email Extension Plugin](https://plugins.jenkins.io/email-ext/)
- [Slack Notification Plugin](https://plugins.jenkins.io/slack/)

---

#### **4. Use Jenkins to Deploy an Application to a Server**

**Deployment Example:**

- **Deploying with SSH:**

  - **Install SSH Pipeline Steps Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "SSH Pipeline Steps Plugin".
  - **Jenkinsfile Example:**

    ```groovy
    stage('Deploy') {
        steps {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'my-server',
                transfers: [sshTransfer(sourceFiles: '**/target/*.jar', removePrefix: false, remoteDirectory: '/path/to/remote/dir')])])
        }
    }
    ```

- **Deploying with Docker:**

  ```groovy
  stage('Deploy') {
      steps {
          script {
              docker.build("my-app", ".")
              docker.withRegistry('https://registry.example.com', 'docker-credentials-id') {
                  docker.image("my-app").push("latest")
              }
          }
      }
  }
  ```

**Resources:**

- [SSH Pipeline Steps Plugin](https://plugins.jenkins.io/publish-over-ssh/)
- [Docker Pipeline Plugin](https://plugins.jenkins.io/docker-workflow/)

---

#### **5. Learn About Jenkins Agents and Distributed Builds**

**Jenkins Agents:**

- **Overview:**

  - Jenkins agents (or nodes) run build jobs on remote machines. This helps distribute the load and allows for parallel execution.

- **Set Up a Jenkins Agent:**

  - **Configure the Master:**

    - Go to "Manage Jenkins" > "Manage Nodes and Clouds" > "New Node".
    - Create a new node with the necessary details (e.g., SSH connection details).

  - **Agent Configuration:**
    - **On the Agent Machine:** Install the Jenkins agent (or use the Java Web Start method).
    - **Connect the Agent:** Ensure the agent connects to the Jenkins master and is online.

- **Example Use in Jenkinsfile:**

  ```groovy
  pipeline {
      agent {
          node {
              label 'my-agent-label'
          }
      }
      stages {
          stage('Build') {
              steps {
                  echo 'Building on agent...'
              }
          }
      }
  }
  ```

**Resources:**

- [Managing Jenkins Agents](https://www.jenkins.io/doc/book/managing/nodes/)
- [Distributed Builds](https://www.jenkins.io/doc/book/using/agent/)

---

### **Documentation**

**Document the Following:**

- **Jenkins Pipeline Syntax:**

  - Example Jenkinsfiles (Declarative and Scripted).
  - Explanation of syntax and usage.

- **Automated Testing:**

  - How to integrate testing stages.
  - Example configurations and test reporting.

- **Notifications and Alerts:**

  - Setting up email and Slack notifications.
  - Example notification configurations in Jenkinsfile.

- **Application Deployment:**

  - Deployment methods and Jenkinsfile examples.
  - Instructions for setting up SSH or Docker deployments.

- **Jenkins Agents:**
  - Setting up and configuring Jenkins agents.
  - Example usage in Jenkinsfile.

---
