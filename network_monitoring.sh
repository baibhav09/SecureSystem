#!/bin/bash

# Automated script for network monitoring and port management

# Set variables
LOG_DIR="/var/log/network_monitor"
TCPDUMP_LOG="$LOG_DIR/tcpdump_$(date +'%Y-%m-%d_%H-%M-%S').pcap"
WIRESHARK_LOG="$LOG_DIR/wireshark_analysis_$(date +'%Y-%m-%d_%H-%M-%S').txt"
PORTS_TO_MONITOR="80,443,22"  # Example: HTTP, HTTPS, SSH ports

# Ensure log directory exists
mkdir -p $LOG_DIR

# Function to capture network traffic using tcpdump
capture_traffic() {
    tcpdump -i any -w $TCPDUMP_LOG &
    PID=$!
    sleep 30  # Capture traffic for 30 seconds (adjust as needed)
    kill $PID  # Stop tcpdump after capturing traffic
}

# Function to analyze open ports and network traffic
analyze_network() {
    # Check open ports
    open_ports=$(netstat -tuln | awk '{print $4}' | grep -E ":(80|443|22)" | awk -F: '{print $NF}' | sort -u)

    # Check for unexpected open ports
    for port in $PORTS_TO_MONITOR; do
        if ! echo "$open_ports" | grep -q "$port"; then
            echo "Warning: Port $port is not intended to be open."
            # Implement action to close the port (example: iptables command)
            # Uncomment the line below to simulate closing the port (example)
            # iptables -A INPUT -p tcp --dport $port -j DROP
        fi
    done

    # Analyze network traffic using Wireshark (example command)
    tshark -r $TCPDUMP_LOG -q -z conv,tcp > $WIRESHARK_LOG

    # Example analysis: Check for spikes in network traffic (adjust as needed)
    traffic_spike=$(grep "spike" $WIRESHARK_LOG)

    if [[ -n "$traffic_spike" ]]; then
        echo "Network traffic spike detected. Investigate further."
        # Implement action to mitigate traffic spike (example: block IP)
        # Uncomment the line below to simulate blocking an IP (example)
        # iptables -A INPUT -s 192.168.1.100 -j DROP
    fi
}

# Main script execution
capture_traffic   # Capture network traffic using tcpdump
analyze_network   # Analyze open ports and network traffic

# Clean up old log files (optional)
find $LOG_DIR -type f -mtime +7 -delete  # Delete logs older than 7 days
