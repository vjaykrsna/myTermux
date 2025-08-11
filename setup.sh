pkg update
termux-change-repo
pkg install -y python ruby golang nodejs perl rust python-pip
pkg install -y git wget curl 
pkg install -y nano micro
pkg install -y fish zsh
pkg install -y proot clang 
pkg install -y cmatrix figlet cowsay toilet screenfetch
pkg install -y ollama openssh unrar unzip ffmpeg sqlite
pkg install -y net-tools termux-api composer libffi fakeroot libxml2-utils

pip install --upgrade pip
pip install requests 
gem install lolcat

termux-setup-storage

# Youtube-dl
curl -L https://raw.githubusercontent.com/OzakIOne/termux-youtube-dl/v2.0.1/install.sh | bash

# Package check
curl -sL https://gist.githubusercontent.com/santhoshkumar/aba032a6dae1940ed57d860d5a0d963d/raw/bd18596aff92295dbcf102e6570deb5f0561a085/package.sh | bash
