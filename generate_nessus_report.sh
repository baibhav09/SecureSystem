#!/bin/bash

# Set Nessus credentials and server details
NESSUS_USERNAME="your_nessus_username"
NESSUS_PASSWORD="your_nessus_password"
NESSUS_SERVER="nessus_server_ip_or_hostname"
NESSUS_PORT="8834"  # Default port for Nessus web interface

# Export scan results in PDF format (example scan ID, replace with your actual scan ID)
SCAN_ID="1"
nessuscli report export --format pdf --output nessus_report.pdf --scan-id "$SCAN_ID" --username "$NESSUS_USERNAME" --password "$NESSUS_PASSWORD" --server "https://$NESSUS_SERVER:$NESSUS_PORT"

echo "Nessus report generated: nessus_report.pdf"
