#Termux config https://github.com/aszadzinski/dotfiles/termux/pkg.sh
#run: sh pkg.sh

pkg update
pkg install gnupg wget -y

#adding pointless repo
echo "deb https://its-pointless.github.io/files/ termux extras" >> $PREFIX/etc/apt/sources.list
wget https://its-pointless.github.io/pointless.gpg
apt-key add pointless.gpg
rm pointless.gpg

#instaling deps
pkg update
pkg install termux-api python python-dev p7zip nmap net-tools make man htop gzip grep git curl cmake openssh vim neofetch tar  julia numpy scipy libzmq-dev libcrypt-dev fftw freetype freetype-dev libpng libpng-dev pkg-config ranger tracepath make-dev -y

#python modules *may take a long time (+10min)*
LDFLAGS="-lzmq" pip3 install jupyter 
pip3 install hyperdash click virtualenv matplotlib

#jupyter configuration
jupyter notebook --generate-config
echo "Jupyter password:"
jupyter notebook password

#generating ssh keys
ssh-keygen -f ~/.ssh/id_rsa -b 4096

echo "DONE"
echo "clear"  >> .bashrc
