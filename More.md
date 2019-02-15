# More things to know

## How to create a copy of your PI's image

Say you spend a lot of time and you have everything setup as you would like it. Nothing need to change, but you want to replicate it every where. Here is how to do it. 

In Terminal, enter the following command to create a disc image (.dmg) of your SD Card in your home directory.
```bash
sudo dd if=/dev/disk1 of=~/SDCardBackup.dmg
 ```
Wait until the SD card has been completely read; the command does not show any feedback, so wait for the command prompt to reappear in the terminal window once it is complete.

Now if your need an exact copy, you can restore it exactly how it was. 
You have two options:

1. You could use the ballena software we describe in the [README.md](./README.md) to write the image to a new card.
2. If you want to practice your terminal chops, you could follow the next steps


Before you can write to the card you have to 'unmount' it so that the operating system does not try to write to it at the same time.  Use the following in the Terminal:
```bash
diskutil unmountDisk /dev/disk1
```
Then use the this to write the image back to the SD card:
```bash
sudo dd if=~/SDCardBackup.dmg of=/dev/disk1
```
Once it has finished writing the image to the SD card, you can remove it from your Mac using:
```bash
sudo diskutil eject /dev/rdisk3
```
