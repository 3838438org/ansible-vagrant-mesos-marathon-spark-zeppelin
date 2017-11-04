#!/bin/bash
# prepare.sh: Prepares the environment for testing Ansible roles on Vagrant/Virtulabox VMs

# Provision VMs
vagrant up

# Create a directory for Ansible roles
mkdir -p ./roles

# Download required Ansible roles
ansible-galaxy install -r requirements.yml

# The downloaded roles have dependencies on two different java roles. To make it
# consistent I decided to replace dependency on `azavea.java` with
# `geerlingguy.java` in ansible-spark role
sed -i 's/azavea.java/geerlingguy.java/g' ./roles/azavea.spark/meta/main.yml
