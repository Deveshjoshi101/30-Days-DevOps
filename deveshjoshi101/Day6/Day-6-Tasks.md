### Day 6: Networking in Bash

#### **Task 1: Learn Basic Networking Commands (ping, netstat, ifconfig)**

**Objective:** Understand and practice basic networking commands in Bash to troubleshoot and monitor network issues.

**Key Commands:**

1. **`ping`:** Checks the network connectivity to a host.

   ```bash
   ping -c 4 google.com
   ```

   - **`-c 4`**: Sends 4 packets.

2. **`netstat`:** Displays network connections, routing tables, and interface statistics.

   ```bash
   netstat -tuln
   ```

   - **`-tuln`**: Shows TCP and UDP listening ports in numerical form.

3. **`ifconfig`:** Configures and displays network interfaces.
   ```bash
   ifconfig
   ```
   - Displays IP address, netmask, and other network settings of interfaces.

**Outcome:** Proficiency with basic networking commands, essential for diagnosing and troubleshooting network-related issues in a Linux environment.

---

#### **Task 2: Write a Script to Monitor Network Connectivity**

**Objective:** Create a script to monitor the connectivity to a specific host or server by continuously pinging it.

**Script:**

```bash
#!/bin/bash
# Script to monitor network connectivity

host="google.com"
log_file="network_status.log"

while true; do
    if ping -c 1 $host &>/dev/null; then
        echo "$(date): $host is reachable." >> $log_file
    else
        echo "$(date): $host is not reachable." >> $log_file
    fi
    sleep 60
done
```

**Explanation:**

- The script continuously pings the specified host (`google.com` in this case) every 60 seconds.
- Logs the connectivity status with a timestamp into `network_status.log`.

**Outcome:** A simple network monitoring script that logs the reachability of a specified host, useful for tracking connectivity issues over time.

---

#### **Task 3: Automate the Process of Checking Open Ports**

**Objective:** Develop a script to automate the process of checking which ports are open on a system.

**Script:**

```bash
#!/bin/bash
# Script to check open ports

echo "Open ports on $(hostname):"
sudo netstat -tuln | grep LISTEN
```

**Explanation:**

- Uses `netstat` with `grep` to filter and display only the ports that are currently listening for incoming connections.

**Outcome:** A quick and automated way to check open ports on a system, helping to identify and secure unnecessary services.

---

#### **Task 4: Write a Script to Fetch Data from a Web Page Using `curl`**

**Objective:** Use `curl` to fetch and display data from a specific web page.

**Script:**

```bash
#!/bin/bash
# Script to fetch data from a web page

url="https://www.example.com"
output_file="webpage_content.html"

curl -o $output_file $url

echo "Data fetched from $url and saved to $output_file."
```

**Explanation:**

- **`curl -o`**: Saves the fetched data to a specified file (`webpage_content.html`).
- Fetches the content of `https://www.example.com` and saves it locally.

**Outcome:** A practical script to retrieve and save web page content, useful for automating tasks like downloading data or monitoring website changes.

---

#### **Task 5: Schedule a Script to Periodically Check a Website’s Status**

**Objective:** Write a script to check if a website is up and schedule it to run periodically using `cron`.

**Script:**

```bash
#!/bin/bash
# Script to check website status

url="https://www.example.com"
log_file="website_status.log"

status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $url)

if [ $status_code -eq 200 ]; then
    echo "$(date): $url is up. Status code: $status_code" >> $log_file
else
    echo "$(date): $url is down. Status code: $status_code" >> $log_file
fi
```

**Scheduling with `cron`:**

1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add a cron job to run the script every 10 minutes:
   ```bash
   */10 * * * * /path/to/script.sh
   ```

**Explanation:**

- The script checks the HTTP status code of the specified URL.
- Logs whether the website is up or down, based on the status code (200 indicates the website is up).

**Outcome:** A scheduled task that periodically checks and logs the status of a website, useful for monitoring website availability.

---
