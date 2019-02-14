#!/usr/bin/env bash
echo "Starting basic set up"
INSTALL_NODE=false
INSTALL_GIT=true

# paths
VIMRC="./.vimrc"
MOTD="./.MOTD"
BASHRC="./.bashrc"

REMOTE_VIMRC="https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/.vimrc"
REMOTE_MOTD="https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/.MOTD"


## this is a simple way to show a multiline echo
cat << EOF
This will take care of installing the basic stuff you would expect
but we would like to ask a few basic questions first.


EOF

function getUserInput {
  # while true; do
      read -p "Do you wish to install git?" yn
      case $yn in
          [Yy]* ) INSTALL_GIT=true; echo "got it" ; break;;
          [Nn]* ) INSTALL_GIT=false; echo "cool you do it"  break;;
          * ) echo "Please answer yes or no.";;
      esac
      read -p "Do you wish to install node?" yn
      case $yn in
          [Yy]* ) INSTALL_NODE=true;echo "got it" ; break;;
          [Nn]* ) INSTALL_NODE=false;echo "cool you do it"  break;;
          * ) echo "Please answer yes or no.";;
      esac
  # done
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
# if we wanted to get fancy this could fisrt check if the alias exist and repalce it
echo 'alias info="bash '$MOTD'"' >> $BASHRC
}


getUserInput

installVimRc
#
installMOTD

## things that don't need a function
# apt-get update
# apt-get upgrade

#reboot



echo "Value for installing node:"$INSTALL_NODE
echo "Value for installing git:"$INSTALL_GIT
