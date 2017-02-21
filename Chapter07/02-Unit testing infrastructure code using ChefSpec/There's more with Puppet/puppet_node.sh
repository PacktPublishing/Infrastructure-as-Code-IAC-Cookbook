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

# Install Puppet Agent from puppetlabs
# This will remove puppet-common package provided by the vagrant box
echo "Installing Agent..."
apt-get install -y puppet-agent

# Ensure puppet agent is stopped for our tests
/opt/puppetlabs/bin/puppet resource service puppet ensure=stopped enable=false

echo "Puppet agent installed!"
