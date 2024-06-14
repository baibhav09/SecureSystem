#!/bin/bash

# Set Splunk credentials and server details
SPLUNK_USERNAME="your_splunk_username"
SPLUNK_PASSWORD="your_splunk_password"
SPLUNK_SERVER="splunk_server_ip_or_hostname"
SPLUNK_PORT="splunk_server_port"

# Search query example (change to your specific query)
SEARCH_QUERY="index=main sourcetype=access_* | stats count by host"

# Run search and export results to CSV
splunk search "$SEARCH_QUERY" -auth "$SPLUNK_USERNAME:$SPLUNK_PASSWORD" -uri "https://$SPLUNK_SERVER:$SPLUNK_PORT" -output csv > splunk_report.csv

echo "Splunk report generated: splunk_report.csv"
