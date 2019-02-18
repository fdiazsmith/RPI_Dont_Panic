```
__ \    _ \    \  |  ) __ __|       _ \    \      \  | _ _|   ___|      |
|   |  |   |    \ | /     |        |   |  _ \      \ |   |   |          |
|   |  |   |  |\  |       |        ___/  ___ \   |\  |   |   |         _|
____/  \___/ _| \_|      _|       _|   _/    _\ _| \_| ___| \____|     _)
```

### Easy 4-step Raspberry Pi Setup 🔧

*This guide will help you prepare and setup a Raspberry Pi in 4 easy steps*

---

**1.** Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) and flash your micro SD card with [Etcher](https://etcher.io/)

---

**2.** Paste the files from [setup](./setup) and edit files:

```
<YOUR COMPUTER>/
├── boot/
│   ├── config.txt     <-- in a new line add: dtoverlay=dwc2
│   ├── cmdline.txt    <-- after `rootwait` add a space and paste: modules-load=dwc2,g_ether
│   ├── ...

│   └── ssh                     <-- add this one
│   └── wpa_supplicant.conf     <-- add and edit this one with your wifi settings
```

>*More [info](https://www.thepolyglotdeveloper.com/2016/06/connect-raspberry-pi-zero-usb-cable-ssh/) on ssh over USB*

---

**3.** In terminal ssh into the pi: ```sudo ssh pi@raspberrypi.local```<br>*Default password is 'raspberry'. To change password use the `passwd` command*

---

**4.** Get your PI up to speed:

```
sudo curl -s https://raw.githubusercontent.com/fdiazsmith/RPI_Dont_Panic/master/basic_setup.sh -o basic_setup.sh && bash basic_setup.sh && rm basic_setup.sh
```

>This [post](https://stackoverflow.com/questions/5735666/execute-bash-script-from-url) explains how to download and execute a bash script....
here we should have a bash file that you can curl and do everything else
  * update and upgrade
  * (opt.)[instal python3](https://gist.github.com/SeppPenner/6a5a30ebc8f79936fa136c524417761d)
  * install git1
  * install basic [vimrc](https://github.com/amix/vimrc)
  * (opt.) install [netatalk](http://netatalk.sourceforge.net/)
  * (opt.) install node
  * install bash aliases
  * [custom $PS1 in bash](http://bashrcgenerator.com/)
  * reboot
    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)  * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install
    * [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)  * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)    * Maye just install [oh-my-zsh](https://escapologybb.com/oh-my-zsh/)
*  enable i2c    
```sudo apt-get install -y python-smbus
    sudo apt-get install -y i2c-tools```

    and also enable[SPI](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-spi)
### That is it!


---

just notes eventually they will go away

8. download vim. and then some useful `.vimrc` like this one from [amix](https://github.com/amix/vimrc)
    more `.vimrc` file options, [this](https://gist.github.com/simonista/8703722)
    if you would like to learn it your self follow [this](https://dougblack.io/words/a-good-vimrc.html)
    this one is good [too](https://chrisyeh96.github.io/2017/12/18/vimrc.html)
all my pi have fernando as default password


[colorful echo ](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
[custom MOTD](https://www.raspberrypi.org/forums/viewtopic.php?t=23440)
