#!/bin/bash

cd /shared/vagrant/files

tar zxvf simplejson-2.1.0.tar.gz
mv setuptools-0.6c11-py2.4.egg simplejson-2.1.0/
cd simplejson-2.1.0 && python setup.py install
