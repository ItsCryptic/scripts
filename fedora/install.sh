#/bin/bash

echo "Hello! This script will setup your system for use. Please only run this once and let the script complete. Thank you $USER"

#Do updates
sudo dnf upgrade --refresh -y
#Add flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#Install applications
#Install discord
sudo flatpak install com.discordapp.Discord -y
#Install flatseal
sudo flatpak install com.github.tchx84.Flatseal -y 
#Install dolphin
sudo flatpak install org.DolphinEmu.dolphin-emu -y
#Install vscode
sudo flatpak install com.visualstudio.code -y
#Install steam
sudo flatpak install com.valvesoftware.Steam -y
#Install zoom
sudo flatpak install us.zoom.Zoom -y
#Install minecraft
sudo flatpak install com.mojang.Minecraft -y
#Install lunar client
sudo flatpak install com.lunarclient.LunarClient -y
#Install Spotify
sudo flatpak install com.spotify.Client -y

#Shell setup
#Install ZSH
sudo dnf install zsh -y

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install starship
sudo dnf install starship

#Export variables & aliases
lines=("alias vim='nvim'" "alias ..='cd ..'" \
                          "alias lsblk='lsblk -e 7" \
                          "eval \"$(starship init zsh)\"" )
for line in "${lines[@]}"; do
  grep -q "$line" $SUDO_USER/.zshrc || printf '%s\n' "$line" >> $SUDO_USER/.zshrc
done

chsh -s /bin/zsh $SUDO_USER

#Make apps run on startup
cp ~/usr/share/applications/Discord.desktop ~/.config/autostart
cp ~/usr/share/applications/Spotify.desktop ~/.config/autostart

#Finish
echo "Done. We will reboot your system in 10 seconds."
sleep 10
sudo reboot