echo "Starting basic set up"
INSTALL_NODE=false
INSTALL_GIT=true
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) echo "got it" ; break;;
        [Nn]* ) echo "cool you do it"  exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
