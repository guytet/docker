#!/usr/bin/env bash

# Create linux image directories
distros=(bionic buster centos7 fedora30-server fedora32-server stretch)

base_dir=/docker_data/dhcp_and_pxe_debian
images_dir=$base_dir/images

[[ ! -d $images_dir ]] && mkdir $images_dir

for distro in ${distros[@]}; do
 [[ ! -d $images_dir/$distro ]] &&  mkdir $images_dir/$distro
done


wget -P $images_dir/centos7  http://mirrors.mit.edu/centos/7.8.2003/os/x86_64/images/pxeboot/vmlinuz
wget -P $images_dir/centos7  http://mirrors.mit.edu/centos/7.8.2003/os/x86_64/images/pxeboot/initrd.img

wget -P $images_dir/fedora30-server http://mirrors.mit.edu/fedora/linux/releases/30/Server/x86_64/os/images/pxeboot/vmlinuz
wget -P $images_dir/fedora30-server http://mirrors.mit.edu/fedora/linux/releases/30/Server/x86_64/os/images/pxeboot/initrd.img

wget -P $images_dir/fedora32-server http://mirrors.mit.edu/fedora/linux/releases/32/Server/x86_64/os/images/pxeboot/vmlinuz
wget -P $images_dir/fedora32-server http://mirrors.mit.edu/fedora/linux/releases/32/Server/x86_64/os/images/pxeboot/initrd.img


wget -P $images_dir/buster http://mirrors.mit.edu/debian/dists/buster/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux
wget -P $images_dir/buster http://mirrors.mit.edu/debian/dists/buster/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz

wget -P $images_dir/stretch http://mirrors.mit.edu/debian/dists/stretch/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux
wget -P $images_dir/stretch http://mirrors.mit.edu/debian/dists/stretch/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz

wget -P $images_dir/bionic  http://mirrors.mit.edu/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux
wget -P $images_dir/bionic  http://mirrors.mit.edu/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz

