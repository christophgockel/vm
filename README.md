# VM

Create new virtual machines as disposable development environments. Batteries included.

## Prerequisites

Uses [Packer](https://www.packer.io), [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org).

If these components are already available on your host-system, you're good to go.
If not, the `Makefile` tries to use [Homebrew](http://brew.sh) to download and install the needed components.

Currently tested and used with Mac OS X 10.10, Packer 0.7.5, Vagrant 1.7.0 and VirtualBox 4.3.8.

## Creating a New VM

Creating and provisioning a new VM is as easy as executing `make`.

The steps taken care of by the `Makefile` are as follows:

1. Check if all the necessary components are available (and install what's missing)
2. Use Packer to create the base ISO image and build a Vagrant box with it
3. Adds the newly created box to Vagrant

From there on the new VM is bootable by running `vagrant up` followed by a `vagrant ssh` to log in to it.


## Credits
General idea and initial configuration copied from [skim](https://github.com/sl4m) and his [vm repo](https://github.com/sl4m/vm).

:boom: :goat: :hamburger:
