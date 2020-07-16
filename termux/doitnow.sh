curl https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/packages.txt --output packages.txt
curl https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/zshrc --output zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aszadzinski/dotfiles/master/termux/pkg.sh)"

rm packages.txt
rm zshrc

