#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# puppetlabs URL
DEBREPO="https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb"

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."
debrepo=$(mktemp)
wget --output-document=${debrepo} ${DEBREPO} 
dpkg -i ${debrepo} 
apt-get update 

# Install Puppet Server from puppetlabs
# This will remove puppet-common package provided by the vagrant box (if any)
echo "Installing Puppet..."
apt-get install -y puppetserver

# For tests, limit memory usage. 512m is enough
sed -i 's/2g/512m/g' /etc/default/puppetserver

# For tests, enable autosign for all csr
echo "autosign=true" | tee --append /etc/puppetlabs/puppet/puppet.conf

# Restart puppetserver
service puppetserver restart

# Ensure puppetserver is running and enable it on boot
/opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true

echo "Puppet server installed!"
