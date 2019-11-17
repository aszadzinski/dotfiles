sudo apt install vim tmux cryptsetup tor zsh openssh-server openssh-client nmap neofetch stress python3 python3-pip julia python3-dev cmake make gcc  wiringpi i3 git grep man htop p7zip tar zip unzip w3m traceroute mtr tor-arm fail2ban haveged gnupg fonts-font-awesome vim-fugitive vim-syntastic  wget curl tree lnav ranger xorg feh compton terminator aspell-pl sox libsox-fmt-all libsox-fmt-mp3 libsndfile1-dev

mkdir Musics
mkdir Musics/radio
mkdir Musics/radio/piFM
git clone https://github.com/ChristopheJacquet/PiFmRds.git Musics/radio/piFM
cd Musics/radio/piFM/src
make clean
make
