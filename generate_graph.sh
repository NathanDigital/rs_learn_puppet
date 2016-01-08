#!/usr/bin/env bash
puppet apply /etc/puppet/manifests/site.pp --noop --graph
apt-get -y install graphviz
mkdir /vagrant/tmp
dot -Tpng /var/lib/puppet/state/graphs/resources.dot -o /vagrant/tmp/resources.png
dot -Tpng /var/lib/puppet/state/graphs/relationships.dot -o /vagrant/tmp/relationships.png
dot -Tpng /var/lib/puppet/state/graphs/expanded_relationships.dot -o /vagrant/tmp/expanded_relationships.png
