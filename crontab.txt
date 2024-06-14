#!/bin/bash

# Configure crontab for automated script execution

# Set up crontab entries
(crontab -l 2>/dev/null; echo "0 2 * * * /path/to/automated_log_analysis.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 3 * * 0 /path/to/patch_management.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 4 * * 1 /path/to/nessus_vulnerability_scan.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 * * * * /path/to/network_monitoring.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 5 * * * /path/to/splunk_monitoring.sh") | crontab -

echo "Crontab configured for automated script execution."
