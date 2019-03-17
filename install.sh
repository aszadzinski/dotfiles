# Packages installer & configurator

sudo pacman -Syu --noconfirm
sudo pacman -S $(cat pkglist.md) --noconfirm
yay -S $(cat aurlist.md)


sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

