FROM ubuntu:20.04

# subset of what built-in /usr/local/sbin/unminimize does, but faster
RUN dpkg-divert --quiet --remove --rename /usr/bin/man
RUN mv /etc/dpkg/dpkg.cfg.d/excludes /etc/dpkg/dpkg.cfg.d/excludes.dpkg-tmp

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install git vim man-db manpages-posix

# reinstall to get man pages
RUN apt-get reinstall -y coreutils

RUN git clone https://github.com/rkitover/vimpager

COPY reproducer.sh wrapper.sh /
