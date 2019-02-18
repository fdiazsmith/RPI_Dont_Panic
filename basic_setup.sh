#!/usr/bin/env bash
echo "Starting basic set up"
INSTALL_NODE=false
INSTALL_GIT=true
INSTALL_NETTALK=true
INSTALL_PYTHON3=true

# paths
VIMRC="./.vimrc"
MOTD="./.MOTD"
BASHRC="./.bashrc"
BASHALIASES="./.bash_aliases"

REMOTE_VIMRC="https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/.vimrc"
REMOTE_MOTD="https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/.MOTD"
REMOTE_BASHALIASES="https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/.bash_aliases"

## this is a simple way to show a multiline echo
cat << EOF
==================================================================
Dont Panic! This will take care of installing the basic stuff you would expect
but we would like to ask a few basic questions first.
==================================================================
Here is what is going to happen:
                  - update and upgrade
                  - install git
                  - install .vimrc
                  - install .bash_aliases
                  - custom $PS1 in bash
                  - (opt.) instal python3
                  - (opt.) install netatalk
                  - (opt.) install node
                  - reboot
EOF

function getUserInput {
  while true; do
    #GIT
    read -p "Do you wish to install Git? (y/n) " yn
    case $yn in
        [Yy]* ) INSTALL_GIT=true; echo "Good choice!" ;break;;
        [Nn]* ) INSTALL_GIT=false; echo "cool, do it your way." ; break;;
        * ) echo "Please answer yes or no.";;
    esac
  done
  while true; do
    #NETTALK
    read -p "Do you wish to install NetYalk? (y/n) " yn
    case $yn in
      [Yy]* ) INSTALL_NETTALK=true;echo "Good choice!" ;break;;
      [Nn]* ) INSTALL_NETTALK=false;echo "cool, do it your way." ;break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
  while true; do
    #NODE
    read -p "Do you wish to install Node? (y/n) " yn
    case $yn in
      [Yy]* ) INSTALL_NODE=true;echo "Good choice!" ;break;;
      [Nn]* ) INSTALL_NODE=false;echo "cool, do it your way." ;break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
  while true; do
    #NODE
    read -p "Do you wish to install Python3? (y/n) " yn
    case $yn in
      [Yy]* ) INSTALL_PYTHON3=true;echo "Good choice!" ;break;;
      [Nn]* ) INSTALL_PYTHON3=false;echo "cool, do it your way." ;break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function installVimRc {
cat << EOF
Installing VIM...

EOF
# first install actual vim pi only comes with vi
#apt-get install vim

# Download file and write to file (I guess this could also use the -o flag of curl )
curl -s $REMOTE_VIMRC | cat >> $VIMRC
}

function installMOTD {
cat << EOF
Installing MOTD...

EOF
# Download file and write to file (I guess this could also use the -o flag of curl )
curl -s $REMOTE_MOTD | cat >> $MOTD
## we need to make sure it is executable
sudo chmod 755 /etc/motd.tcl
# if we wanted to get fancy this could fisrt check if the alias exist and repalce it
echo 'alias info="bash '$MOTD'"' >> $BASHRC
}

function installAliases {
cat << EOF
Installing Aliases...

EOF
# Download file and write to file (I guess this could also use the -o flag of curl )
curl -s $REMOTE_BASHALIASES | cat >> $BASHALIASES
## we need to make sure it is executable
sudo chmod 755 /etc/motd.tcl
## this customieses your $PS1
echo 'export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> $BASHRC
}

function installNode {
cat << EOF
Installing Node...

EOF
sudo apt-get install nodejs npm git-core
}

function installGit {
cat << EOF
Installing Git...

EOF
sudo apt-get install git
git config --global user.name "Raspberry Pi"
git config --global user.email "rasberry@pi.com"
git config --global core.editor vim
}

function installNetaTalk {
cat << EOF
Installing Git...

EOF
sudo apt-get install netatalk
}

function installPython3 {
cat << EOF
Installing Python3...

EOF
# sudo apt-get update -y
sudo apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev -y
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure
make -j 4
sudo make altinstall
cd ..
sudo rm -r Python-3.7.0
rm Python-3.7.0.tar.xz
sudo apt-get --purge remove build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev -y
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get install python3-pip
}

### Process starts here
getUserInput


if $INSTALL_GIT; then
  installGit
fi

if $INSTALL_NODE; then
  installNode
fi

if $INSTALL_NETTALK; then
  installNetaTalk
fi

if $INSTALL_PYTHON3; then
  installPython3
fi


installVimRc

installMOTD

## things that don't need a function
# sudo apt-get update
# sudo apt-get upgrade

# sudo reboot
