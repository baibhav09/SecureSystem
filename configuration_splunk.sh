#!/bin/bash

# Splunk server details
SPLUNK_USERNAME="admin"
SPLUNK_PASSWORD="your_splunk_password"
SPLUNK_HOST="splunk_server_ip_or_hostname"
SPLUNK_PORT="8089"  # Default Splunk management port

# Function to add data inputs
function add_data_input {
    local input_path=$1
    local index_name=$2
    local sourcetype_name=$3

    /opt/splunk/bin/splunk add monitor $input_path -index $index_name -sourcetype $sourcetype_name
}

# Function to add alerts
function add_alert {
    local alert_name=$1
    local condition_query=$2

    /opt/splunk/bin/splunk add alert "$alert_name" -condition "$condition_query" -action email
}

# Function to create dashboard panels
function create_dashboard_panel {
    local dashboard_file=$1
    local panel_title=$2
    local panel_query=$3

    cat << EOF >> $dashboard_file
<panel>
  <title>$panel_title</title>
  <search>
    <query>$panel_query</query>
    <earliest>-24h@h</earliest>
    <latest>now</latest>
  </search>
  <chart>
    <search>
      <query>$panel_query | timechart count by host</query>
      <earliest>-24h@h</earliest>
      <latest>now</latest>
    </search>
  </chart>
</panel>
EOF
}

# Configure data inputs

# Monitor syslog for system logs
add_data_input "/var/log/syslog" "main" "syslog"

# Monitor SSH logs for authentication attempts
add_data_input "/var/log/auth.log" "main" "auth"

# Monitor Apache access logs for web traffic
add_data_input "/var/log/apache2/access.log" "main" "apache_access"

# Monitor file system changes using auditd logs (if available)
add_data_input "/var/log/audit/audit.log" "main" "auditd"

# Set up alerts

# Alert on potential remote code execution attempts
add_alert "Remote Code Execution Attempt" "search index=main (sourcetype=syslog OR sourcetype=auth) ('exec' OR 'system' OR 'shell')"

# Alert on open ports detected
add_alert "Open Ports Detected" "search index=main sourcetype=netstat open_ports"

# Alert on suspicious network traffic patterns
add_alert "Suspicious Network Traffic" "search index=main sourcetype=apache_access status>=400"

# Alert on unauthorized file changes
add_alert "Unauthorized File Changes" "search index=main sourcetype=auditd (action=chmod OR action=unlink)"

# Create dashboard for security events
cat << EOF > /opt/splunk/etc/apps/search/local/data/ui/views/security_dashboard.xml
<dashboard>
  <label>Security Dashboard</label>
  <row>
    $(create_dashboard_panel "/opt/splunk/etc/apps/search/local/data/ui/views/security_dashboard.xml" "Remote Code Execution Attempts" "search index=main (sourcetype=syslog OR sourcetype=auth) ('exec' OR 'system' OR 'shell')")
  </row>
  <row>
    $(create_dashboard_panel "/opt/splunk/etc/apps/search/local/data/ui/views/security_dashboard.xml" "Open Ports Detected" "search index=main sourcetype=netstat open_ports")
  </row>
  <row>
    $(create_dashboard_panel "/opt/splunk/etc/apps/search/local/data/ui/views/security_dashboard.xml" "Unauthorized File Changes" "search index=main sourcetype=auditd (action=chmod OR action=unlink)")
  </row>
</dashboard>
EOF

echo "Splunk configuration for security monitoring complete."
