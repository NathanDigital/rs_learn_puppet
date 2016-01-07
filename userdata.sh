#!/usr/bin/env bash

#installing puppet is not nessary on vagrant machine, but includeing here for completeness 
apt-get update
apt-get -y install puppet

#install required modules and their dependancies from puppet forge, this is a manualy updated file
bash /vagrant/modules.sh

#Link our module and a starter config file
ln -s /vagrant/puppet/modules/rs_learn_puppet /etc/puppet/modules/rs_learn_puppet
ln -s /vagrant/puppet/manifests/site.pp /etc/puppet/manifests/site.pp

#initial puppet run
puppet apply -v /etc/puppet/manifests/site.pp

