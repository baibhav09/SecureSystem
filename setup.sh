#!/bin/bash

# Clone the repository
git clone https://github.com/yourusername/securesystem.git
cd securesystem

# Run the install dependencies script
bash scripts/install_dependencies.sh

# Configure crontab
bash scripts/configure_crontab.sh

echo "Setup completed."