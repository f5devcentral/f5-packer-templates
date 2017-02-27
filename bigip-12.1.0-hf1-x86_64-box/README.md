# BIG-IP 12.1.0 HF1 Vagrant box

This packer template can be used to build a BIG-IP vagrant box for version
12.1.0 HF1.

## Requirements

This template requires that Virtualbox be installed on the machine
the packer command is run on.

## Usage

Download copies of the following files

  * BIGIP-12.1.0.0.0.1434
  * Hotfix-BIGIP-12.1.0.1.0.1447-HF1.iso

and place them in the following folder.

  * software/

Next, run the following command

    make

and wait for it to finish. The resulting box will be found in your
current working directory.
