# SecureSystem

#### Project Overview
SecureSystem is dedicated to securing Ubuntu systems using advanced tools like Splunk, Nessus, and Kali Linux. It includes initial system analysis, robust security monitoring, automated playbooks, and network security measures. The project aims to uphold stringent security standards to protect against potential threats.

---

### Table of Contents

1. [Initial System Analysis](#initial-system-analysis)
2. [Security Monitoring Setup](#security-monitoring-setup)
3. [Automation Playbooks](#automation-playbooks)
4. [Network Security](#network-security)
5. [Installation and Setup](#installation-and-setup)
6. [Scripts and Configuration Files](#scripts-and-configuration-files)
7. [Cron Jobs](#cron-jobs)
8. [Usage](#usage)

---

### Initial System Analysis

Conduct thorough system and vulnerability assessment using Nessus and Splunk. After generating reports we need to immediate work on the findings and try terminate all the vulnerabilities highlighted in the report.

Adjust URLs and package names: Ensure the URLs for downloading Nessus and Splunk packages are up-to-date. The examples provided may not be current.
Execution: Make the scripts executable with chmod +x install_dependencies_ubuntu.sh and chmod +x install_dependencies_kali.sh.
Run as root: These scripts assume they are executed with sufficient privileges (e.g., using sudo).

Now we need to generate reports for further analysis of the system.

Make the scripts executable:
**chmod +x generate_splunk_report.sh
chmod +x generate_nessus_report.sh
**
Execute the scripts:
**./generate_splunk_report.sh
./generate_nessus_report.sh
**

We can schedule a cron job to weekly generate the reports for continuous monitoring.
---

### Security Monitoring Setup

Configure Splunk for centralized log management. Set up alerts and dashboards for real-time monitoring of security events.

Key Features
Open Ports Detection

Monitors network traffic to identify and alert on open ports.
Enhances network security by detecting unexpected service exposures.
SSH Login Failures

Tracks authentication logs to alert on unsuccessful SSH login attempts.
Provides early warning of potential brute-force attacks or unauthorized access attempts.
Remote Code Execution Monitoring

Scans system logs for suspicious commands (exec, system, shell) indicative of remote code execution attempts.
Alerts administrators to potential compromises and facilitates rapid response.
Unauthorized File Changes Detection

Monitors audit logs for file system modifications (action=chmod, action=unlink).
Alerts on unauthorized alterations, protecting against malicious activities like tampering or data exfiltration.
---

### Automation Playbooks

Develop scripts for automated log analysis, patch management, and periodic vulnerability scans using Nessus. Ensure scripts are scheduled for regular execution. Also incorporate incident report insights to refine automation.
Use cron jobs (crontab -e) to schedule scripts on a regular basis
Ensure scripts have appropriate permissions (chmod +x script.sh) for execution.

---

### Network Security

Monitor and manage network ports and services to prevent unauthorized access and ensure secure communication. Create an automated script to continuously dump the network traffic from tcp dumps and wireshark. Try analyzing any open ports and check the network traffic if there is spike or not. An try closing the open ports if not opened intentionally.

The Network Monitoring Script provides a foundation for automating network monitoring, port management, and traffic analysis to enhance security and mitigate potential threats effectively.
