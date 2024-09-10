### Day 21: Introduction to Ansible

**Objective:** Learn about Ansible and its architecture, install Ansible, write a simple playbook, configure inventory files, and execute Ansible commands and playbooks.

---

#### **1. Learn About Ansible and Its Architecture**

**Ansible Overview:**

- **Ansible** is an open-source automation tool used for configuration management, application deployment, and task automation.

**Architecture:**

- **Control Node:** The machine where Ansible is installed and from which commands and playbooks are executed.
- **Managed Nodes:** The target machines that Ansible manages and configures.
- **Modules:** Built-in or custom scripts executed on managed nodes to perform tasks (e.g., installing packages, copying files).
- **Playbooks:** YAML files that define the tasks to be executed on managed nodes.
- **Inventory:** A file that lists the managed nodes and their details.
- **Roles:** A way to organize playbooks into reusable components.

**Components:**

- **Playbook:** Defines the set of tasks to be executed on the managed nodes.
- **Inventory File:** Lists the hosts and groups of hosts.
- **Configuration File:** Defines Ansible settings and parameters.

---

#### **2. Install Ansible on Your System**

**On Ubuntu/Debian:**

1. **Update the package list:**

   ```bash
   sudo apt update
   ```

2. **Install Ansible:**

   ```bash
   sudo apt install ansible
   ```

**On CentOS/RHEL:**

1. **Install EPEL repository:**

   ```bash
   sudo yum install epel-release
   ```

2. **Install Ansible:**

   ```bash
   sudo yum install ansible
   ```

**Verify Installation:**

```bash
ansible --version
```

---

#### **3. Write a Simple Playbook to Install a Package on a Remote Server**

**Create a Directory for Your Playbooks:**

```bash
mkdir ~/ansible-playbooks
cd ~/ansible-playbooks
```

**Create a Playbook File (`install_package.yml`):**

```yaml
---
- name: Install a package on remote servers
  hosts: all
  become: yes
  tasks:
    - name: Install the `htop` package
      apt:
        name: htop
        state: present
```

**Explanation:**

- `name:` Describes the playbook.
- `hosts:` Defines the target hosts.
- `become:` Elevates privileges to run tasks as a superuser.
- `tasks:` Lists the tasks to be executed.
- `apt:` Module used to manage packages (use `yum` for RHEL/CentOS).

---

#### **4. Learn About Inventory Files and Configure Them**

**Default Inventory File Location:**

- `/etc/ansible/hosts`

**Create a Custom Inventory File (`inventory.ini`):**

```ini
[webservers]
webserver1 ansible_host=192.168.1.10
webserver2 ansible_host=192.168.1.11

[dbservers]
dbserver1 ansible_host=192.168.1.20
```

**Explanation:**

- `[webservers]` and `[dbservers]` are groups of hosts.
- `ansible_host` specifies the IP address or hostname of the managed node.

**Specify Inventory File When Running Playbooks:**

```bash
ansible-playbook -i inventory.ini install_package.yml
```

---

#### **5. Execute Ansible Commands and Playbooks**

**Ping All Hosts:**

```bash
ansible all -i inventory.ini -m ping
```

**Run a Playbook:**

```bash
ansible-playbook -i inventory.ini install_package.yml
```

**Explanation:**

- `ansible all` runs commands on all hosts defined in the inventory.
- `-i inventory.ini` specifies the inventory file.
- `-m ping` uses the `ping` module to check connectivity.
- `ansible-playbook` executes the specified playbook.

---

### **Example Workflow**

1. **Install Ansible:**

   ```bash
   sudo apt update
   sudo apt install ansible
   ```

2. **Create a Playbook:**

   ```yaml
   ---
   - name: Install a package on remote servers
     hosts: all
     become: yes
     tasks:
       - name: Install the `htop` package
         apt:
           name: htop
           state: present
   ```

3. **Configure Inventory File:**

   ```ini
   [webservers]
   webserver1 ansible_host=192.168.1.10
   webserver2 ansible_host=192.168.1.11

   [dbservers]
   dbserver1 ansible_host=192.168.1.20
   ```

4. **Run Commands and Playbooks:**

   - **Ping Hosts:**

     ```bash
     ansible all -i inventory.ini -m ping
     ```

   - **Execute Playbook:**

     ```bash
     ansible-playbook -i inventory.ini install_package.yml
     ```

---

### **Documentation**

**Document the Following:**

- **Ansible Architecture:**
  - Overview of Ansible components and architecture.
- **Installation Instructions:**
  - Steps for installing Ansible on different systems.
- **Simple Playbook:**
  - Example playbook for installing a package.
- **Inventory File:**
  - Explanation and example of an inventory file.
- **Execution Commands:**
  - Commands for running Ansible playbooks and tasks.

---
