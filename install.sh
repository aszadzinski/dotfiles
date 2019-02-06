# Packages installer & configurator

sudo pacman -Syu
sudo pacman -S $(cat pkglist.md)
yay -S $(cat aurlist.md)

