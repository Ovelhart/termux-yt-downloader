pkg upgrade && pkg update
pkg install bash -y
chsh -s bash
clear
pkg install git -y
pkg install python -y
pip install lolcat

if [ -d ~/termux-yt-downloader ]; then
  rm -rf ~/termux-yt-downloader
fi

git clone https://github.com/Ovelhart/termux-yt-downloader.git
mkdir ~/.termux
pkg install toilet -y

clear

if [ -f ~/.termux/colors.properties ]; then
  echo "It exists, erasing..."
  rm ~/.termux/colors.properties
else
  echo "continuing..."
fi

if [ -f ~/.bashrc ]; then
  echo "It exists, erasing..."
  rm ~/.bashrc
else
  echo "continuing..."
fi

[ -f ~/.termux/font.ttf ] && rm ~/.termux/font.ttf

curl -L -o ~/.termux/font.ttf https://raw.githubusercontent.com/Ovelhart/termux-yt-downloader/font.ttf
clear

mv ~/termux-yt-downloader/.bashrc ~/
mv ~/termux-yt-downloader/colors.properties ~/.termux/
termux-reload-settings