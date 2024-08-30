### Day 10: Linux Processes and Jobs

#### **Task 1: Learn About Linux Processes and How to Manage Them**

**Objective:** Understand what processes are in Linux, how they work, and how to manage them.

**Key Concepts:**

- **Process:** A running instance of a program.
- **PID (Process ID):** A unique identifier for each process.
- **Parent and Child Processes:** A process can spawn other processes, known as child processes.

**Commands for Managing Processes:**

- **List Running Processes:**
  ```bash
  ps aux
  ```
  - `a` for all users, `u` for user-oriented format, `x` for processes without a controlling terminal.
- **Terminate a Process:**

  ```bash
  kill PID
  ```

  - Replace `PID` with the process ID you want to terminate.

- **Force Terminate a Process:**

  ```bash
  kill -9 PID
  ```

  - Forcefully terminates a process.

- **Start a Process in the Background:**

  ```bash
  command &
  ```

- **Bring a Background Process to the Foreground:**
  ```bash
  fg
  ```

**Outcome:** Understanding of what processes are, how they are managed, and how to control them using basic commands.

---

#### **Task 2: Practice Using `ps`, `top`, and `htop` to Monitor Processes**

**Objective:** Gain experience with tools to monitor system processes.

**Commands:**

1. **`ps`:** View active processes.

   ```bash
   ps aux
   ```

   - Displays detailed information about all running processes.

2. **`top`:** Real-time process monitoring.

   ```bash
   top
   ```

   - Press `q` to exit.

3. **`htop`:** Enhanced interactive process viewer.
   ```bash
   sudo apt-get install htop
   htop
   ```
   - Offers a more user-friendly interface than `top`.

**Outcome:** Ability to monitor and analyze system processes in real-time, helping with system performance and troubleshooting.

---

#### **Task 3: Explore Job Scheduling with `cron` and `at`**

**Objective:** Learn how to schedule tasks to run at specific times using `cron` and `at`.

**Using `cron`:**

- **Edit `cron` jobs:**
  ```bash
  crontab -e
  ```
  - Example of a cron job that runs a script every day at 2 AM:
    ```bash
    0 2 * * * /path/to/script.sh
    ```

**Using `at`:**

- **Schedule a one-time job:**

  ```bash
  at 5:00 PM
  ```

  - Enter the command to run, followed by `Ctrl+D` to save.

- **List scheduled `at` jobs:**

  ```bash
  atq
  ```

- **Remove a scheduled `at` job:**
  ```bash
  atrm job_number
  ```

**Outcome:** Understanding of how to automate tasks using `cron` for repetitive tasks and `at` for one-time jobs.

---

#### **Task 4: Write a Script to Monitor and Kill Processes Automatically**

**Objective:** Create a script that automatically monitors and terminates processes based on certain criteria.

**Script Implementation:**

```bash
#!/bin/bash

# Define the process name or part of the name
PROCESS_NAME="example_process"

# Set the CPU usage threshold (in %)
CPU_THRESHOLD=80

# Monitor and kill processes exceeding the CPU threshold
while true; do
    ps -eo pid,%cpu,comm --sort=-%cpu | grep "$PROCESS_NAME" | while read -r pid cpu command; do
        if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
            echo "Process $command (PID: $pid) is using $cpu% CPU. Killing it."
            kill -9 "$pid"
        fi
    done
    sleep 10
done
```

- **Explanation:**
  - The script monitors processes matching `PROCESS_NAME`.
  - If a process exceeds the `CPU_THRESHOLD`, it is terminated.
  - The script checks every 10 seconds.

**Outcome:** A practical tool to automatically manage resource-hogging processes, improving system stability.

---

#### **Task 5: Learn About Runlevels and How to Manage Services**

**Objective:** Understand Linux runlevels and how to manage services across these levels.

**Key Concepts:**

- **Runlevels:** Different states of the system, each with a specific purpose (e.g., single-user mode, multi-user mode).

  - Runlevels 0-6:
    - **0:** Halt
    - **1:** Single-user mode
    - **2-5:** Multi-user modes (2 is typically default)
    - **6:** Reboot

- **Systemd:** Modern systems use `systemd` instead of traditional runlevels.
  - **Targets:** The `systemd` equivalent of runlevels.

**Commands:**

1. **Check Current Runlevel:**

   ```bash
   runlevel
   ```

2. **Change Runlevel (using `telinit`):**

   ```bash
   sudo telinit 3
   ```

   - Changes to runlevel 3 (multi-user without GUI).

3. **List All Services:**

   ```bash
   systemctl list-units --type=service
   ```

4. **Start/Stop a Service:**
   ```bash
   sudo systemctl start service_name
   sudo systemctl stop service_name
   ```

**Outcome:** Understanding of how to manage system states and services, enabling more effective control over the system's behavior and resource allocation.

---
