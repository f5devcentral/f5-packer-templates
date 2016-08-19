# f5-packer-templates

Packer templates that can be used to build BIG-IP Vagrant boxes from BIG-IP ISOs

## About

These directories contain packer templates that you can use to build BIG-IP
images for things such as Virtualbox or other tools that you might use.

The requirements to build these Vagrant boxes is nothing more than what is
already available on F5's downloads.f5.com site. If you have access to that,
then you have access to the necessary ISOs needed to make Vagrant boxes.

The output of these templates is VE instances and the audience here that
I am targetting is specifically those who need to develop something against
a BIG-IP.

If you are familiar with a BIG-IPs licensing restrictions and Vagrant, you
will say to yourself

    but BIG-IP wont accept my license when I 'vagrant up' a second time

And you will be right!

There are three options here

  * Get iWorkflow and buy a pool of licenses to activate against
  * Use a single license and call F5 support every time you need to 'vagrant up'
  * Request that F5 begin selling "recycleable" developer licenses
  
Those options are all probably less than ideal, but I don't make the rules.

## Support

I guarantee that you will find no help from F5 official support. I'm
putting this repository out there simply as a proof of concept.

If something doesn't work, you're free to raise Issues in Github here, but
I may not respond to them immediately, or at all.

## Instructions

Refer to the README.md files in each of the template directories. Some of
the templates seem "more verbose" than they should be. This is due to either
a bug in BIG-IP, packer, or my local system where `tmsh` commands seem to
stop returning exit codes after a reboot.

## Third party tools

Some of the older images (pre 12.0.0) required the inclusion of some third
party open source tools

  * [setuptools](https://pypi.python.org/pypi/setuptools)
  * [simplejson](https://pypi.python.org/pypi/simplejson)
  * [sudo](https://www.sudo.ws/sudo/download.html)
  
Those tools are not needed by later images because later code either included
them already, or did not need them because sufficiently updated copies already
existed.

## More releases

If/when F5 releases Vagrant boxes on downloads.f5.com, then this repository
may largely become obsolete. This isn't likely to happen anytime soon though.

As new releases of BIG-IP happen (Hotfixes and major releases) I will update
the packer templates here. Do not expect a new template to land until after the
official F5 release.

If you have interest in a release that is not found in this repo, and is listed
as supported by F5 at our releases SOL5903 page here

  * https://support.f5.com/kb/en-us/solutions/public/5000/900/sol5903.html
  
Then open an issue on Github and I will address it.

## Required packer version

I always use the latest version, so use that. I build these images on a Mac. YMMV
on other platforms, but it _should_ work.