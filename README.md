# 30-Day DevOps Training Program

Welcome to the 30-Day DevOps Training Program! This guide is designed to help you build a strong foundation in DevOps practices, focusing on Bash scripting, Linux fundamentals, Docker, Ansible, Jenkins, and Kubernetes.

## Table of Contents

- [Introduction](#introduction)
- [Week 1: Bash Scripting](#week-1-bash-scripting)
- [Week 2: Linux Fundamentals](#week-2-linux-fundamentals)
- [Week 3: Docker](#week-3-docker)
- [Week 4: Ansible, Jenkins, and Kubernetes](#week-4-ansible-jenkins-and-kubernetes)
- [Final Project](#final-project)
- [Happy Learning!](#happy-learning)

## Introduction

This 30-day training program is structured to provide hands-on experience with essential DevOps tools and practices. Each week focuses on a different core area, with daily tasks and mini-projects to reinforce your learning.

---

## Week 1: Bash Scripting

### Day 1: Introduction to Bash Scripting
- **Task 1:** Set up a Linux environment (e.g., Ubuntu in VirtualBox or WSL).
- **Task 2:** Learn basic Bash commands (e.g., `ls`, `cd`, `echo`, `cat`).
- **Task 3:** Write a simple script to automate file creation and deletion.
- **Task 4:** Use conditional statements (`if`, `else`, `elif`) in a script.
- **Task 5:** Read and process user input in a script.

### Day 2: Working with Files and Directories
- **Task 1:** Create, copy, move, and delete files and directories using Bash.
- **Task 2:** Write a script to batch rename files based on a pattern.
- **Task 3:** Use loops (`for`, `while`) to iterate over files in a directory.
- **Task 4:** Implement error handling in your scripts.
- **Task 5:** Learn about file permissions and modify them using `chmod`.

### Day 3: Text Processing in Bash
- **Task 1:** Learn and practice using `grep`, `sed`, and `awk`.
- **Task 2:** Write a script to search and replace text in files.
- **Task 3:** Use `awk` to analyze and format a text file.
- **Task 4:** Practice sorting and filtering text data using `sort` and `uniq`.
- **Task 5:** Write a script to summarize data from a log file.

### Day 4: Automation with Bash
- **Task 1:** Write a script to automate system updates.
- **Task 2:** Schedule tasks using `cron` and `at`.
- **Task 3:** Write a backup script for a directory.
- **Task 4:** Automate the setup of a development environment.
- **Task 5:** Write a script to monitor system resource usage.

### Day 5: Advanced Bash Scripting
- **Task 1:** Learn about functions in Bash and write reusable code.
- **Task 2:** Write a script to manage user accounts (e.g., create, delete).
- **Task 3:** Explore and use Bash arrays.
- **Task 4:** Write a script to check the status of a service.
- **Task 5:** Implement a simple menu-driven interface in a script.

### Day 6: Networking in Bash
- **Task 1:** Learn basic networking commands (`ping`, `netstat`, `ifconfig`).
- **Task 2:** Write a script to monitor network connectivity.
- **Task 3:** Automate the process of checking open ports.
- **Task 4:** Write a script to fetch data from a web page using `curl`.
- **Task 5:** Schedule a script to periodically check a website’s status.

### Day 7: Mini Project
- **Project:** Create a comprehensive system maintenance script that performs backups, checks disk usage, updates the system, and monitors system health. Document the script with clear comments and usage instructions.

---

## Week 2: Linux Fundamentals

### Day 8: Linux File System and Structure
- **Task 1:** Understand the Linux directory structure.
- **Task 2:** Learn about mounting and unmounting file systems.
- **Task 3:** Explore and practice with `df`, `du`, and `fdisk` commands.
- **Task 4:** Create and manage partitions using `parted` or `gparted`.
- **Task 5:** Learn about file system permissions and ownership.

### Day 9: Linux Users and Permissions
- **Task 1:** Learn about user and group management.
- **Task 2:** Practice creating, deleting, and modifying user accounts.
- **Task 3:** Learn about and modify user privileges (e.g., `sudo`).
- **Task 4:** Understand and configure file permissions using `chmod` and `chown`.
- **Task 5:** Write a script to manage users and permissions.

### Day 10: Linux Processes and Jobs
- **Task 1:** Learn about Linux processes and how to manage them.
- **Task 2:** Practice using `ps`, `top`, and `htop` to monitor processes.
- **Task 3:** Explore job scheduling with `cron` and `at`.
- **Task 4:** Write a script to monitor and kill processes automatically.
- **Task 5:** Learn about runlevels and how to manage services.

### Day 11: Package Management in Linux
- **Task 1:** Learn about package managers (e.g., `apt`, `yum`, `dnf`).
- **Task 2:** Practice installing, updating, and removing packages.
- **Task 3:** Explore and configure package repositories.
- **Task 4:** Write a script to automate package updates.
- **Task 5:** Learn about and use Snap and Flatpak packages.

### Day 12: Linux Networking Basics
- **Task 1:** Learn about IP addressing and subnetting.
- **Task 2:** Configure network interfaces using `ifconfig` or `ip`.
- **Task 3:** Practice using networking tools like `ping`, `traceroute`, and `netstat`.
- **Task 4:** Set up and configure a basic firewall using `ufw` or `iptables`.
- **Task 5:** Write a script to automate network configuration.

### Day 13: Shell Scripting for Linux Administration
- **Task 1:** Write a script to automate user account creation.
- **Task 2:** Automate the setup of a basic LAMP/LEMP stack.
- **Task 3:** Write a script to monitor disk space and send alerts.
- **Task 4:** Automate the process of system updates and upgrades.
- **Task 5:** Write a script to manage and archive log files.

### Day 14: Mini Project
- **Project:** Set up a Linux server with a complete LAMP/LEMP stack, configure basic security settings (firewall, SSH keys), and write scripts to automate routine maintenance tasks. Document the entire process with clear instructions.

---

## Week 3: Docker

### Day 15: Introduction to Docker
- **Task 1:** Learn about Docker and containerization concepts.
- **Task 2:** Install Docker on your system.
- **Task 3:** Pull and run a basic Docker container (e.g., Nginx).
- **Task 4:** Learn about Docker images and how to manage them.
- **Task 5:** Explore and practice using Docker commands (`docker run`, `docker ps`, `docker stop`).

### Day 16: Working with Docker Containers
- **Task 1:** Learn about and create Dockerfiles.
- **Task 2:** Build and run a custom Docker image.
- **Task 3:** Practice managing containers (start, stop, restart).
- **Task 4:** Use Docker volumes to persist data.
- **Task 5:** Network multiple containers together.

### Day 17: Docker Compose
- **Task 1:** Learn about Docker Compose and its use cases.
- **Task 2:** Write a `docker-compose.yml` file to define a multi-container application.
- **Task 3:** Practice managing services with Docker Compose.
- **Task 4:** Use Docker Compose to set up a development environment.
- **Task 5:** Explore Docker Compose commands (`up`, `down`, `logs`).

### Day 18: Docker Networking
- **Task 1:** Learn about Docker networking concepts.
- **Task 2:** Create and manage Docker networks.
- **Task 3:** Connect containers across multiple networks.
- **Task 4:** Practice using bridge and overlay networks.
- **Task 5:** Explore Docker networking tools like `docker network ls`, `inspect`.

### Day 19: Docker Security
- **Task 1:** Learn about best practices for securing Docker containers.
- **Task 2:** Explore Docker security features (e.g., user namespaces, SELinux).
- **Task 3:** Implement security scanning for Docker images.
- **Task 4:** Configure and use Docker secrets.
- **Task 5:** Learn about Docker Bench for Security and run it on your containers.

### Day 20: Mini Project
- **Project:** Deploy a multi-tier web application using Docker Compose, ensuring the application is secure, persistent, and scalable. Document the process and include security best practices.

---

## Week 4: Ansible, Jenkins, and Kubernetes

### Day 21: Introduction to Ansible
- **Task 1:** Learn about Ansible and its architecture.
- **Task 2:** Install Ansible on your system

.
- **Task 3:** Write a simple Ansible playbook.
- **Task 4:** Learn about inventory files and host groups.
- **Task 5:** Practice running playbooks and managing remote servers.

### Day 22: Ansible Playbooks and Roles
- **Task 1:** Learn about Ansible roles and how to use them.
- **Task 2:** Write a role to install and configure Nginx.
- **Task 3:** Use Ansible Vault to encrypt sensitive data.
- **Task 4:** Implement error handling and idempotency in playbooks.
- **Task 5:** Write a playbook to automate a multi-server deployment.

### Day 23: Jenkins Fundamentals
- **Task 1:** Learn about Jenkins and its role in CI/CD.
- **Task 2:** Install Jenkins and set up a basic job.
- **Task 3:** Practice configuring Jenkins pipelines using the GUI.
- **Task 4:** Learn about Jenkins plugins and how to use them.
- **Task 5:** Set up Jenkins integration with GitHub for automatic builds.

### Day 24: Jenkins Pipelines
- **Task 1:** Learn about Jenkins pipelines and their syntax.
- **Task 2:** Write a simple Jenkinsfile for a CI/CD pipeline.
- **Task 3:** Explore Jenkins pipeline stages (build, test, deploy).
- **Task 4:** Integrate Docker with Jenkins for containerized builds.
- **Task 5:** Automate deployment to a staging server using Jenkins.

### Day 25: Introduction to Kubernetes
- **Task 1:** Learn about Kubernetes architecture and components.
- **Task 2:** Set up a local Kubernetes environment (Minikube or Kind).
- **Task 3:** Deploy a simple application to Kubernetes.
- **Task 4:** Explore Kubernetes resources (pods, services, deployments).
- **Task 5:** Practice using `kubectl` to manage Kubernetes resources.

### Day 26: Kubernetes Networking and Storage
- **Task 1:** Learn about Kubernetes networking concepts.
- **Task 2:** Practice configuring services (ClusterIP, NodePort, LoadBalancer).
- **Task 3:** Understand and use Persistent Volumes and Persistent Volume Claims.
- **Task 4:** Deploy a stateful application with Kubernetes.
- **Task 5:** Learn about Ingress controllers and set up an Ingress rule.

### Day 27: Advanced Kubernetes Topics
- **Task 1:** Learn about Kubernetes security best practices.
- **Task 2:** Practice using ConfigMaps and Secrets.
- **Task 3:** Explore Kubernetes monitoring tools (Prometheus, Grafana).
- **Task 4:** Implement auto-scaling with Horizontal Pod Autoscaler.
- **Task 5:** Deploy a complete CI/CD pipeline on Kubernetes.

### Day 28: Mini Project
- **Project:** Deploy a microservices-based application on Kubernetes with CI/CD integration using Jenkins. Ensure high availability, scaling, and monitoring. Document the entire process with clear steps.

### Day 29: Final Review
- **Task 1:** Review all the concepts and tasks covered in the program.
- **Task 2:** Identify areas that need further practice.
- **Task 3:** Plan for continuous learning beyond the program.
- **Task 4:** Reflect on the projects completed and lessons learned.
- **Task 5:** Update your resume or portfolio with the projects and skills acquired.

### Day 30: Final Project Presentation
- **Task:** Prepare and present your final project to peers or mentors. Provide a detailed walkthrough of the process, challenges, solutions, and best practices learned throughout the program.

---

## Final Project

Deploy a complete DevOps workflow using Docker, Jenkins, Ansible, and Kubernetes. This project will involve setting up a CI/CD pipeline, automating infrastructure deployment, managing configuration, and ensuring the application’s scalability, availability, and security.

### Objectives:
- **CI/CD Pipeline:** Set up a Jenkins pipeline to build, test, and deploy a containerized application.
- **Configuration Management:** Use Ansible to automate server configuration and application deployment.
- **Containerization:** Package the application with Docker and deploy it to Kubernetes.
- **Orchestration:** Use Kubernetes to manage container deployment, scaling, and networking.
- **Monitoring and Logging:** Implement monitoring and logging solutions using tools like Prometheus, Grafana, and ELK stack.

### Deliverables:
- Project documentation, including a detailed README file.
- All source code and scripts used in the project.
- Screenshots or a video walkthrough of the project in action.

---

## Happy Learning!

Enjoy your journey into the world of DevOps! Remember to take breaks, ask questions, and keep experimenting. Good luck!
