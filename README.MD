# Basic and Fast Pi

## Build Guide



## Raspberry Pi Setup 🔧

How to prepare and setup a Raspberry Pi for this project:

1. Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) and flash your micro SD card with [Etcher](https://etcher.io/)

2. Copy the **ssh** and **wpa_supplicant.conf** files from the [setup folder](./setup/) to the SD card (boot). At the 'root' level.
2.1 While you have the boot volume open. open `config.txt`. In this file you want to add the following line at the very bottom:
```dtoverlay=dwc2```
2.2 The next file we alter is `cmdline.txt`, but it is a bit different. Parameters in this file are not delimited by new lines or commas, they are delimited by space characters. In this file we want to add the following: `modules-load=dwc2,g_ether`[original tutorial](https://www.thepolyglotdeveloper.com/2016/06/connect-raspberry-pi-zero-usb-cable-ssh/)

3. Edit the **wpa_supplicant.conf** in a text editor to match your wifi settings. Insert the card to the raspberry pi

4. In terminal ssh into the pi: ```sudo ssh pi@raspberrypi.local```<br>*Default password is 'raspberry'. To change password use the 'passwd' command*

This [post](https://stackoverflow.com/questions/5735666/execute-bash-script-from-url) explains how to download and execute a bash script
```
bash <(curl -s https://raw.githubusercontent.com/fdiazsmith/basic_PI/master/basic_setup.sh)
```
> here we should have a bash file that you can curl and do everything else
  * update and upgrade
  * install git
  * install basic vimrc
  * install netatalk
  * other libraries that we want?
  * node ?
  * reboot

5. Update the pi: ```sudo apt-get update && sudo apt-get upgrade```<br>

7. Reboot ```sudo reboot```

8. download vim. and then some useful `.vimrc` like this one from [amix](https://github.com/amix/vimrc)
    more `.vimrc` file options, [this](https://gist.github.com/simonista/8703722)
    if you would like to learn it your self follow [this](https://dougblack.io/words/a-good-vimrc.html)
    this one is good [too](https://chrisyeh96.github.io/2017/12/18/vimrc.html)
all my pi have fernando as default password


#### Troubleshooting
You have too many ssh key registered for `pi@raspberrypi.local`

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
The ECDSA host key for raspberrypi.local has changed,
and the key for the corresponding IP address fe80::8490:616d:e21e:55a8%en6
is unknown. This could either mean that
DNS SPOOFING is happening or the IP address for the host
and its host key have changed at the same time.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:y8czt3in5UCM890nW8XO5coCOcgeJXHn8ZRSJyHZ/tU.
Please contact your system administrator.
Add correct host key in /var/root/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /var/root/.ssh/known_hosts:1
ECDSA host key for raspberrypi.local has changed and you have requested strict checking.
Host key verification failed.
```

solution is to create an alias
```
ssh -o HostKeyAlias=pi2 pi@raspberrypi.local
```
