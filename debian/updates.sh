#/bin/bash

apt update && apt upgrade -y
echo "Waiting 10 seconds to reboot."
sleep 10
sudo reboot