echo "Starting basic set up"
INSTALL_NODE=false
INSTALL_GIT=true

ECHO "This will take care of installing the basic stuff you would expect\n but we would like to ask a few basic questions first."

function getUserInput {
  #while true; do
      read -p "Do you wish to install git?" yn
      case $yn in
          [Yy]* ) INSTALL_GIT=true; echo "got it" ; break;;
          [Nn]* ) INSTALL_GIT=false; echo "cool you do it"  exit;;
          * ) echo "Please answer yes or no.";;
      esac
      read -p "Do you wish to install node?" yn
      case $yn in
          [Yy]* ) INSTALL_NODE=true;echo "got it" ; break;;
          [Nn]* ) INSTALL_NODE=false;echo "cool you do it"  exit;;
          * ) echo "Please answer yes or no.";;
      esac
  #done
}

getUserInput

echo "Value for installing node:"$INSTALL_NODE
echo "Value for installing git:"$INSTALL_GIT
