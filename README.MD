# Don't Pannic!

## Raspberry Pi Setup 🔧

How to prepare and setup a Raspberry Pi for this project:

1. Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) and flash your micro SD card with [Etcher](https://etcher.io/)

2. Paste and edit boot files:
```
<YOURCOMPUTER>/
├── boot/
│   ├── config.txt     <-- in a new line add: dtoverlay=dwc2
│   ├── cmdline.txt    <-- after rootwait add a space and paste: modules-load=dwc2,g_ether
│   ├── .
│   ├── .       OTHER FILES OMITTED
│   ├── .
│   └── ssh                     <-- add this one
│   └── wpa_supplicant.conf     <-- edit and add this one
```
>More [info](https://www.thepolyglotdeveloper.com/2016/06/connect-raspberry-pi-zero-usb-cable-ssh/) on ssh over USB

3. In terminal ssh into the pi: ```sudo ssh pi@raspberrypi.local```<br>*Default password is 'raspberry'. To change password use the `passwd` command*

4. Get your PI up to speed:
```
sudo curl -s https://raw.githubusercontent.com/fdiazsmith/basic_PI/master/basic_setup.sh -o basic_setup.sh && bash basic_setup.sh && rm basic_setup.sh
```
> This [post](https://stackoverflow.com/questions/5735666/execute-bash-script-from-url) explains how to download and execute a bash script....
here we should have a bash file that you can curl and do everything else
  * update and upgrade
  * install git
  * install basic vimrc
  * install netatalk
  * other libraries that we want?
  * node ?
  * reboot

That is it!











+++++++++++++++++++++++++++++++++++++


just notes eventually they will go away

8. download vim. and then some useful `.vimrc` like this one from [amix](https://github.com/amix/vimrc)
    more `.vimrc` file options, [this](https://gist.github.com/simonista/8703722)
    if you would like to learn it your self follow [this](https://dougblack.io/words/a-good-vimrc.html)
    this one is good [too](https://chrisyeh96.github.io/2017/12/18/vimrc.html)
all my pi have fernando as default password


[colorful echo ](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
[custom MOTD](https://www.raspberrypi.org/forums/viewtopic.php?t=23440)
