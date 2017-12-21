apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential

echo "installing VirtualBox Guest Additions..."
apt-get -y install dkms
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions.iso

echo "setup sudo to allow no-password sudo for 'admin'"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e '/Defaults\s\+env_reset/a Defaults\tenv_keep+=SSH_AUTH_SOCK' /etc/sudoers
sed -i -e '/Defaults\s\+env_reset/a Defaults\tenv_keep+=PATH' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# apt-get install various things
apt-get -y install nfs-common openssl curl git-core sqlite3 autoconf automake bison pkg-config
apt-get clean

# Create .ssh directory
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh

# Remove items used for building, since they aren't needed anymore
apt-get -y remove linux-headers-$(uname -r)
apt-get -y autoremove

# Zero out the free space to save space in the final image:
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M | true
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync

exit
