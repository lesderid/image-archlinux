# Archlinux image on Scaleway

[![Build Status](https://travis-ci.org/lesderid/image-archlinux.svg?branch=master)](https://travis-ci.org/lesderid/image-archlinux)

Scripts to build an Arch Linux (x86_64) image on Scaleway

This image is built using [Image Tools](https://github.com/scaleway/image-tools) and is based on the official [Ubuntu](https://github.com/scaleway/image-ubuntu) image.

![](https://d11xdyzr0div58.cloudfront.net/static/logos/archlinux-logo-dark-scalable.518881f04ca9.svg)

---

**This image is meant to be used on a VC1 server.**

We use the Docker's building system and convert it at the end to a disk image that will boot on real servers without Docker. Note that the image is still runnable as a Docker container for debug or for inheritance.

[More info](https://github.com/scaleway/image-tools#docker-based-builder)

---

## Building

Build and add the image to [your account](https://cloud.scaleway.com/#/images):

    $ make image_on_local
    
Full list of commands available at: [scaleway/image-tools](https://github.com/scaleway/image-tools/#commands)

## Testing
    
To test your image, find the id on your images page and run:

    $ scw run --tmp-ssh-key --name="archlinux" <IMAGE_ID>

---

## Links

- [Community: Add Archlinux ARM image](https://community.cloud.online.net/t/need-feedback-add-arch-linux-arm-image/243?u=manfred)
- [Community: New linux distributions (Debian, CoreOS, CentOS, Fedora, Arch Linux, ...)](https://community.cloud.online.net/t/official-new-linux-distributions-debian-coreos-centos-fedora-arch-linux/229?u=manfred)

---

A project by [![Scaleway](https://avatars1.githubusercontent.com/u/5185491?v=3&s=42)](https://www.scaleway.com/) and lesderid
