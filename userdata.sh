#!/usr/bin/env bash

#installing puppet is not nessary on vagrant machine, but includeing here for completeness 
apt-get update
apt-get -y install puppet

#Link our dirs
rmdir /etc/puppet/modules
rmdir /etc/puppet/manifests
ln -s /vagrant/puppet/modules /etc/puppet/modules
ln -s /vagrant/puppet/manifests /etc/puppet/manifests

#install required modules and their dependancies from puppet forge, this is a manualy updated file
bash /vagrant/modules.sh

#initial puppet run
puppet apply -v /etc/puppet/manifests/site.pp

