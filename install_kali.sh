#!/bin/bash

# Update package lists and install essential packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server wireshark tcpdump

# Install Nessus (example steps, adjust based on current Nessus installation method)
wget https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/12688/download?i_agree_to_tenable_license_agreement=true -O nessus.deb
sudo dpkg -i nessus.deb
sudo apt install -f

# Install Splunk (example steps, adjust based on current Splunk installation method)
wget -O splunk-8.2.1-bff3bb1ccb80-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.1&product=splunk&filename=splunk-8.2.1-bff3bb1ccb80-linux-2.6-amd64.deb&wget=true'
sudo dpkg -i splunk-8.2.1-bff3bb1ccb80-linux-2.6-amd64.deb

# Cleanup downloaded files
rm nessus.deb splunk-8.2.1-bff3bb1ccb80-linux-2.6-amd64.deb

echo "Installation completed."
