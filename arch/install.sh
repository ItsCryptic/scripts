# Do updates
sudo pacman -Syu
sudo pacman -S snap

#Important software, other files that may need to be copied into the home directory will be here at a later date.
sudo snap install discord telegram-desktop putty spotify filezilla minecraft-launcher intellij-idea-community code
sudo pacman -S shutter
sudo pacman -S flatpak

#Install termius
sudo snap install termius-app

#Install osu!
sudo wget https://github.com/ppy/osu/releases/latest/download/osu.AppImage
chmod a+x osu.AppImage
sudo ./osu.AppImage

#Install BitWarden
sudo wget https://github.com/bitwarden/desktop/releases/download/v1.28.3/Bitwarden-1.28.3-x86_64.AppImage
chmod a+x Bitwarden-1.28.3-x86_64.AppImage
sudo ./Bitwarden-1.28.3-x86_64.AppImage

#Install steam
sudo flatpak install flathub com.valvesoftware.Steam
sudo flatpak run com.valvesoftware.Steam
