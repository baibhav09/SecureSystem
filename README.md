# SecureSystem

#### Project Overview
SecureSystem is dedicated to securing Ubuntu systems using advanced tools like Splunk, Nessus, and Kali Linux. It includes initial system analysis, robust security monitoring, automated playbooks, and network security measures. The project aims to uphold stringent security standards to protect against potential threats.

---

### Table of Contents

1. [Initial System Analysis](#initial-system-analysis)
2. [Security Monitoring Setup](#security-monitoring-setup)
3. [Automation Playbooks](#automation-playbooks)
4. [Network Security](#network-security)

---

### Initial System Analysis

Conduct a thorough system and vulnerability assessment using Nessus and Splunk. After generating reports, immediately address and mitigate all vulnerabilities highlighted.

**Steps:**
1. **Install Dependencies:**
    ```bash
    chmod +x install_dependencies_ubuntu.sh
    chmod +x install_dependencies_kali.sh
    ```
    Execute the scripts:
    ```bash
    ./install_dependencies_ubuntu.sh
    ./install_dependencies_kali.sh
    ```

2. **Generate Reports:**
    ```bash
    chmod +x generate_splunk_report.sh
    chmod +x generate_nessus_report.sh
    ```
    Execute the scripts:
    ```bash
    ./generate_splunk_report.sh
    ./generate_nessus_report.sh
    ```

3. **Schedule Weekly Reports:**
    Use cron jobs to schedule the report generation scripts for continuous monitoring:
    ```bash
    crontab -e
    ```

---

### Security Monitoring Setup

Configure Splunk for centralized log management. Set up alerts and dashboards for real-time monitoring of security events.

**Key Features:**
- **Open Ports Detection:**
    - Monitors network traffic to identify and alert on open ports.
    - Enhances network security by detecting unexpected service exposures.

- **SSH Login Failures:**
    - Tracks authentication logs to alert on unsuccessful SSH login attempts.
    - Provides early warning of potential brute-force attacks or unauthorized access attempts.

- **Remote Code Execution Monitoring:**
    - Scans system logs for suspicious commands (exec, system, shell) indicative of remote code execution attempts.
    - Alerts administrators to potential compromises and facilitates rapid response.

- **Unauthorized File Changes Detection:**
    - Monitors audit logs for file system modifications (action=chmod, action=unlink).
    - Alerts on unauthorized alterations, protecting against malicious activities like tampering or data exfiltration.

---

### Automation Playbooks

Develop scripts for automated log analysis, patch management, and periodic vulnerability scans using Nessus. Ensure scripts are scheduled for regular execution and incorporate incident report insights to refine automation.

**Steps:**
1. **Create Automation Scripts:**
    ```bash
    chmod +x automated_log_analysis.sh
    chmod +x patch_management.sh
    chmod +x nessus_vulnerability_scan.sh
    ```

2. **Schedule Scripts:**
    Use cron jobs to schedule scripts on a regular basis:
    ```bash
    crontab -e
    ```
    Ensure scripts have appropriate permissions:
    ```bash
    chmod +x script.sh
    ```

---

### Network Security

Monitor and manage network ports and services to prevent unauthorized access and ensure secure communication. Create an automated script to continuously dump network traffic from tcpdump and Wireshark. Analyze open ports and check for network traffic spikes, and close ports if not opened intentionally.

**Key Features:**
- **Continuous Network Traffic Dump:**
    - Uses tcpdump and Wireshark to continuously monitor network traffic.
    - Analyzes traffic for anomalies and spikes.

- **Open Ports Management:**
    - Identifies and closes unauthorized open ports.
    - Ensures only necessary services are running, minimizing attack surfaces.

**Steps:**
1. **Network Monitoring Script:**
    ```bash
    chmod +x network_monitoring.sh
    ```

2. **Schedule Script:**
    Use cron jobs to automate the network monitoring script:
    ```bash
    crontab -e
    ```

---

### Setup Instructions

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/yourusername/securesystem.git
    cd securesystem
    ```

2. **Run the Setup Script:**
    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

---

SecureSystem provides a comprehensive security solution for Ubuntu systems, integrating advanced tools and automated scripts to ensure robust protection against potential threats.
