#/bin/bash

echo "By default this script blocks ports 25, 587 and 465. If you need to allow these ports for e-mail or similar. Please run ufw allow 25,465,587."
echo "You should also run sudo -s (gains access to root account) and apt update && apt upgrade -y peridodically to get the latest security updates, I'd run this everytime you come into shop, probably at the end of the week."
echo "This will also install apache2. If apache is already installed by this script and you run this anyway you may get an `already installed` message. You can safely ignore that message."

sudo -s
chmod +x scripts/updates.sh
crontab -e || echo "0 0 * * FRI ./updates.sh"
apt update && apt upgrade -y
apt install apache2
apt install ufw
ufw allow 80,443
ufw default deny incoming
ufw default allow outgoing
nano /etc/ssh/sshd_config | echo "Port 4685"
ufw allow ssh
ufw deny out 25
ufw deny out 587
ufw deny out 465
ufw enable
echo "The machine will now reboot. This should only take a few minutes. This installation is also now completed once this happens."
sleep 10
reboot