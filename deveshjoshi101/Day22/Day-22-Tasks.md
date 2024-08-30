### Day 22: Advanced Ansible Usage

**Objective:** Explore advanced Ansible features, including roles, variables, templates, Ansible Vault, and Ansible Galaxy. Write a playbook to set up a web server and utilize roles and templates for enhanced automation.

---

#### **1. Learn About Roles in Ansible and Create a Role**

**Roles Overview:**

- **Roles** are a way to organize playbooks into reusable components. They allow you to group related tasks, handlers, variables, and templates.

**Create a Role:**

1. **Generate Role Structure:**

   ```bash
   ansible-galaxy init my_role
   ```

   This command creates a directory structure for the role:

   ```
   my_role/
   ├── defaults/
   │   └── main.yml
   ├── files/
   ├── handlers/
   │   └── main.yml
   ├── meta/
   │   └── main.yml
   ├── tasks/
   │   └── main.yml
   ├── templates/
   └── vars/
       └── main.yml
   ```

2. **Edit Role Files:**

   **`tasks/main.yml`:** Define the tasks for the role.

   ```yaml
   ---
   - name: Install nginx
     apt:
       name: nginx
       state: present

   - name: Start nginx
     service:
       name: nginx
       state: started
       enabled: yes
   ```

   **`defaults/main.yml`:** Define default variables for the role.

   ```yaml
   ---
   nginx_port: 80
   ```

3. **Use the Role in a Playbook:**

   **`site.yml`:**

   ```yaml
   ---
   - name: Configure web server
     hosts: webservers
     become: yes
     roles:
       - my_role
   ```

---

#### **2. Use Variables and Templates in Your Playbooks**

**Variables:**

- Variables allow you to manage dynamic content in playbooks and roles.

**Define Variables:**

**`vars/main.yml`:**

```yaml
---
nginx_port: 80
```

**Use Variables in a Playbook:**

**`tasks/main.yml`:**

```yaml
---
- name: Install nginx
  apt:
    name: nginx
    state: present

- name: Configure nginx
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
```

**Templates:**

- Templates allow you to dynamically generate configuration files.

**Create a Template (`nginx.conf.j2`):**

```nginx
server {
    listen {{ nginx_port }};
    server_name localhost;

    location / {
        proxy_pass http://localhost:8080;
    }
}
```

**Use the Template in a Playbook:**

```yaml
- name: Configure nginx
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
```

---

#### **3. Implement Ansible Vault to Manage Sensitive Data**

**Ansible Vault Overview:**

- **Ansible Vault** allows you to encrypt sensitive data such as passwords and secret keys within Ansible projects.

**Create an Encrypted File:**

```bash
ansible-vault create secrets.yml
```

**Edit the File to Add Secrets:**

```yaml
db_password: secret_password
```

**Encrypt an Existing File:**

```bash
ansible-vault encrypt vars.yml
```

**Use Encrypted Variables in Playbooks:**

**`site.yml`:**

```yaml
---
- name: Configure web server
  hosts: webservers
  become: yes
  vars_files:
    - secrets.yml
  roles:
    - my_role
```

**Run Playbook with Vault Password:**

```bash
ansible-playbook site.yml --ask-vault-pass
```

---

#### **4. Write a Playbook to Set Up a Web Server**

**Create a Playbook (`setup_web_server.yml`):**

```yaml
---
- name: Set up web server
  hosts: webservers
  become: yes
  vars_files:
    - secrets.yml
  roles:
    - my_role
  tasks:
    - name: Ensure nginx is installed
      apt:
        name: nginx
        state: present

    - name: Configure nginx
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf

    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: yes
```

**Explanation:**

- This playbook installs and configures Nginx on web servers using a role and template.

---

#### **5. Learn About and Use Ansible Galaxy to Share Roles**

**Ansible Galaxy Overview:**

- **Ansible Galaxy** is a repository for sharing and discovering Ansible roles.

**Search for Roles:**

```bash
ansible-galaxy search nginx
```

**Install a Role from Galaxy:**

```bash
ansible-galaxy install geerlingguy.nginx
```

**Include the Role in Your Playbook:**

**`site.yml`:**

```yaml
---
- name: Configure web server
  hosts: webservers
  become: yes
  roles:
    - geerlingguy.nginx
```

**Update Galaxy Roles:**

```bash
ansible-galaxy install -r requirements.yml
```

**`requirements.yml`:**

```yaml
- src: geerlingguy.nginx
```

---

### **Example Workflow**

1. **Create a Role:**

   ```bash
   ansible-galaxy init my_role
   ```

2. **Edit Role Files:**

   - **`tasks/main.yml`:**

     ```yaml
     - name: Install nginx
       apt:
         name: nginx
         state: present
     ```

   - **`defaults/main.yml`:**

     ```yaml
     nginx_port: 80
     ```

   - **`templates/nginx.conf.j2`:**

     ```nginx
     server {
         listen {{ nginx_port }};
         server_name localhost;

         location / {
             proxy_pass http://localhost:8080;
         }
     }
     ```

3. **Use Variables and Templates:**

   ```yaml
   - name: Configure nginx
     template:
       src: nginx.conf.j2
       dest: /etc/nginx/nginx.conf
   ```

4. **Implement Ansible Vault:**

   ```bash
   ansible-vault create secrets.yml
   ```

5. **Write and Execute Playbook:**

   ```yaml
   - name: Set up web server
     hosts: webservers
     become: yes
     roles:
       - my_role
   ```

   ```bash
   ansible-playbook setup_web_server.yml --ask-vault-pass
   ```

6. **Use Ansible Galaxy:**

   ```bash
   ansible-galaxy install geerlingguy.nginx
   ```

   **`site.yml`:**

   ```yaml
   - name: Configure web server
     hosts: webservers
     become: yes
     roles:
       - geerlingguy.nginx
   ```

---

### **Documentation**

**Document the Following:**

- **Roles:**

  - Overview of roles and their structure.
  - Example role with tasks and variables.

- **Variables and Templates:**

  - How to define and use variables.
  - Example template file and its usage.

- **Ansible Vault:**

  - How to create and use encrypted files.
  - Example usage of Vault in playbooks.

- **Web Server Playbook:**

  - Example playbook for setting up a web server.
  - Role and task definitions.

- **Ansible Galaxy:**
  - How to search, install, and use roles from Ansible Galaxy.

---
