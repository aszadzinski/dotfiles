wget https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/packages.txt
wget https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/pkg.sh)"

rm packages.txt
rm zshrc
rm pkg.sh

