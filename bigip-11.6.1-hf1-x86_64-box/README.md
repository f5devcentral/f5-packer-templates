# BIG-IP 11.6.1 HF1 Vagrant box

This packer template can be used to build a BIG-IP vagrant box for version
11.6.1 HF1.

## Requirements

This template requires that Virtualbox be installed on the machine the packer
command is run on.

## Usage

Download copies of the following files

  * BIGIP-11.6.1.0.0.317.iso
  * Hotfix-BIGIP-11.6.1.1.0.326-HF1.iso

and place them in the following folder.

  * software/

Next, run the following command

  packer build template.json

and wait for it to finish. The resulting box will be found in your current
working directory.
