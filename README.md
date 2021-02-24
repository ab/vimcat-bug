# Demo of hanging bug with vimcat on ubuntu

When used as MANPAGER, vimcat hangs after printing the first line of the manpage. This is reliable, but only happens for certain man pages like `timeout`.

Reproduce with the included [Dockerfile](./Dockerfile) and [reproducer.sh](./reproducer.sh).

![./demo.svg](./demo.svg)
