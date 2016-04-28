NAME =			archlinux
VERSION =		latest
VERSION_ALIASES =	2014-12-02
TITLE =			Arch Linux
DESCRIPTION =		A simple, lightweight distribution
SOURCE_URL =		https://github.com/lesderid/image-archlinux
VENDOR_URL =		https://www.archlinux.org/

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	latest
IMAGE_NAME =		Arch Linux


## Image tools  (https://github.com/scaleway/image-tools)
all:    docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
