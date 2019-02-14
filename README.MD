```
__ \    _ \    \  |  ) __ __|       _ \    \      \  | _ _|   ___|      |
|   |  |   |    \ | /     |        |   |  _ \      \ |   |   |          |
|   |  |   |  |\  |       |        ___/  ___ \   |\  |   |   |         _|
____/  \___/ _| \_|      _|       _|   _/    _\ _| \_| ___| \____|     _)
```

## Easy 4-step Raspberry Pi Setup 🔧


*This guide will help you prepare and setup a Raspberry Pi in 4 easy steps*

<img align="left" width="15" src="https://svgsilh.com/svg/2052171.svg">
&nbsp;&nbsp;
Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) and flash your micro SD card with [Etcher](https://etcher.io/)

<img align="left" width="15" src="https://svgsilh.com/svg/2052150.svg">
&nbsp;&nbsp;
Paste the files from [setup](./setup) and edit boot files:

```
<YOUR COMPUTER>/
├── boot/
│   ├── config.txt     <-- in a new line add: dtoverlay=dwc2
│   ├── cmdline.txt    <-- after `rootwait` add a space and paste: modules-load=dwc2,g_ether
│   ├── ...

│   └── ssh                     <-- add this one
│   └── wpa_supplicant.conf     <-- add and edit this one with your wifi settings
```

>More [info](https://www.thepolyglotdeveloper.com/2016/06/connect-raspberry-pi-zero-usb-cable-ssh/) on ssh over USB

<img align="left" width="15" src="https://svgsilh.com/svg/2052130.svg">
&nbsp;&nbsp;
In terminal ssh into the pi: ```sudo ssh pi@raspberrypi.local```<br>*Default password is 'raspberry'. To change password use the `passwd` command*

<img align="left" width="15" src="https://svgsilh.com/svg/2052105.svg">
&nbsp;&nbsp;
Get your PI up to speed:
```
sudo curl -s https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/basic_setup.sh -o basic_setup.sh && bash basic_setup.sh && rm basic_setup.sh
```
> This [post](https://stackoverflow.com/questions/5735666/execute-bash-script-from-url) explains how to download and execute a bash script....
here we should have a bash file that you can curl and do everything else
  * update and upgrade
  * install git
  * install basic [vimrc](https://github.com/amix/vimrc)
  * install [netatalk](http://netatalk.sourceforge.net/)
  * other libraries that we want?
  * node ?
  * reboot

**<span style="font-size: 25px;">That is it!</span>**












---


just notes eventually they will go away

8. download vim. and then some useful `.vimrc` like this one from [amix](https://github.com/amix/vimrc)
    more `.vimrc` file options, [this](https://gist.github.com/simonista/8703722)
    if you would like to learn it your self follow [this](https://dougblack.io/words/a-good-vimrc.html)
    this one is good [too](https://chrisyeh96.github.io/2017/12/18/vimrc.html)
all my pi have fernando as default password


[colorful echo ](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
[custom MOTD](https://www.raspberrypi.org/forums/viewtopic.php?t=23440)
