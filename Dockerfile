FROM derjudge/archlinux
MAINTAINER lesderid <les@lesderid.net>

# Environment
ENV SCW_BASE_IMAGE armbuild/scw-archlinux:2014-12-02

# Update the keyring
RUN pacman -Sy --noconfirm archlinux-keyring

# Force openssl upgrade first (bad symbol issue)
RUN pacman -Sy --noconfirm --force openssl


# Install packages
RUN pacman -Sy --noconfirm \
    bash-completion \
    bc \
    cronie \
    curl \
    dnsutils \
    htop \
    iptables \
    lsb-release \
    mg \
    nbd \
    ntp \
    openbsd-netcat \
    openssh \
    rsync \
    rsyslog \
    screen \
    socat \
    tmux \
    vim \
    wget

# Install base-devel
RUN pacman -Sy --noconfirm --needed base-devel

# Install cool packages
RUN pacman -Sy --noconfirm \
    fish \
    glances \
    mosh \
    neovim \
    openvpn

# Locales
RUN sed 's/^\([^#]\)/#\1/' -i /etc/locale.gen \
 && sed 's/^#en_US.UTF-8/en_US.UTF-8/;s/^#en_GB.UTF-8/en_GB.UTF-8/' -i /etc/locale.gen \
 && echo LANG=en_GB.UTF-8 > /etc/locale.conf \
 && locale-gen


# Patch rootfs
RUN curl -Lkq http://j.mp/scw-skeleton | FLAVORS=common,docker-based,systemd bash -e
ADD ./patches/etc/ /etc/
ADD ./patches/usr/ /usr/


# Systemd
RUN systemctl enable \
        scw-fetch-ssh-keys \
	scw-sync-kernel-modules \
	scw-generate-ssh-keys \
	scw-gen-machine-id.service \
	ntpdate.service \
 	sshd.service \
	serial-getty@ttyS0.service \
  && systemctl mask \
	getty@tty1.service


# packages upgrade
RUN pacman --noconfirm -Suy


# Remove root password
RUN passwd -d root


# Cleanup
RUN pacman-db-upgrade \
 && pacman -Sc --noconfirm \
 && rm -rf /var/cache/pacman/pkg \
 && pacman-db-upgrade
