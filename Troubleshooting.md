
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
