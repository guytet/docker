#!/bin/bash

# written in bash in order to 'force' syntax highlighting,
# these actions are better off done manually, as they can 
# render the host slightly having trouble booting (if done wrong). 

# Create /mounts direcotry, where the iso's will be mounted to
sudo mkdir /mounts
sudo chown -R $SUDO_USER:$SUDO_USER /mounts

# Obtain iso images for each distro that needs to be installed via PXE, 
# store the iso's on a local directory, e.g "data/os_iso, then
# add a line to /etc/fstab for each such disro's iso:
/data/os_iso/redhat/CentOS-7-x86_64-DVD-2003.iso         /mounts/centos7 iso9660 noauto,user,user=guy 0 0
/data/os_iso/redhat/Fedora-Server-dvd-x86_64-30-1.2.iso  /mounts/fedora-server30 iso9660 noauto,user,user=guy 0 0
/data/os_iso/redhat/Fedora-Server-dvd-x86_64-32-1.6.iso  /mounts/fedora-server32 iso9660 noauto,user,user=guy 0 0

# Create rc.local entries - or whichever same option is on
# the hosts's distro, to automount the above, on debian - the
# resulting rc.local looked like so:
#!/bin/bash
mount /mounts/fedora-server30/
mount /mounts/fedora-server32/
mount /mounts/centos7/
exit 0

# Create /docker_data/shared_container_data/dhcp_and_pxe_debian
# Chown to local non sudo user
mkdir -p /docker_data/dhcp_and_pxe_debian
sudo mkdir /docker_data/dhcp_and_pxe_debian
sudo chown $SUDO_USER:$SUDO_USER /docker_data/dhcp_and_pxe_debian/

# obtain boot images: run get_linux_iamges.sh in this directory

# Open port tcp:80 in firewall for lighttpd to function
# Open port udp:67-68 for dhcp and udp:69 for tftp in firewall for dhcp and tftp function

