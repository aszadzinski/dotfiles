#####################################
# Packages installer & configurator #
#####################################

home_dir=~/
git_dir=${home_dir}/Projects/github/
dotfiles=${home_dir}/dotfiles/antergos/
config_dir=${home_dir}/.config/

## Make custom directories
echo "Creating some folders"
mkdir ${home_dir}/{Dropbox,Projects,VShare,Camera}
mkdir ${git_dir}
mkdir ${home_dir}/.atom
mkdir ${config_dir}/{i3,ranger,terminator} 

## Get data
git clone git@github.com:/aszadzinski/dotfiles ${git_dir}/dotfiles

## INSTALL from repo 
sudo pacman -Syu --noconfirm
sudo pacman -S $(cat ${dotfiles}/pkglist.md) --noconfirm
yay -S $(cat ${dotfiles}/aurlist.md)

## ZSH
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

## CUSTOM SCRIPTS
git clone git@github.com:aszadzinski/scripts-notes-etc.git ${git_dir}/scripts
cd ${git_dir}/scripts/python/security/mac_changer/
read -p "Do you want to install macc program? (y/n)" macc
if [ "${macc}" == "y" ];then
	sudo python setup.py install
else
	echo "Cancelled."
fi

## MOVING CONFIG FILES
cp -r ${dotfiles}/.config/compton.conf ${config_dir}/
cp -r ${dotfiles}/.config/i3/* ${config_dir}/i3/
cp -r ${dotfiles}/.config/ranger/* ${config_dir}/ranger/
cp -r ${dotfiles}/.config/terminator/* ${config_dir}/terminator/
cp -r ${dotfiles}/.atom/*  ${home_dir}/.atom/

read -p "Dangerous section! Modify /etc/files? (y/n)" choice

if [ "${choice}" == "y" ];then
	sudo cp ${dotfiles}/vim/vimrc /etc/vimrc
else
	echo "Cancelled"
fi
