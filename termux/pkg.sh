#Termux config https://github.com/aszadzinski/dotfiles/termux/pkg.sh
#run: sh pkg.sh

echo "Restoring termux settings..."

echo "- wake lock"
termux-wake-lock
echo "- setting up storage"
termux-setup-storage

pkg update -y 
pkg install $(cat packages.txt) -y

echo "- installed packages"

#adding pointless repo
#echo "deb https://its-pointless.github.io/files/ termux extras" >> $PREFIX/etc/apt/sources.list
#wget https://its-pointless.github.io/pointless.gpg
#apt-key add pointless.gpg
#rm pointless.gpg
#pkg update

#python modules *may take a long time (+10min)*
#LDFLAGS="-lzmq" pip3 install jupyter 
#pip3 install hyperdash click virtualenv #matplotlib

#jupyter configuration
#jupyter notebook --generate-config
#echo "Jupyter password:"
#jupyter notebook password

#generating ssh keys
echo "- ssh config"
ssh-keygen -f ~/.ssh/id_rsa -b 4096

echo "- setting up oh my zsh"
cp zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "DONE"
echo "clear"  >> ~/.bashrc
