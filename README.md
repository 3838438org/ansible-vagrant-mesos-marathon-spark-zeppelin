# Intro

This is a set of Ansible roles and playbooks for testing Mesos, Marathon, Spark and Zeppelin integrated together on Vagrant/Virtualbox local environment.

Requirements:
- Vagrant
- VirtualBox
- Ansible

# Preparation of the environment

To prepare the environment run:
`prepare.sh`

The script will create three Vagrant/VirtualBox VMs and download Ansible roles to deploy the solution.


# Deploy Mesos+Marathon+Spark

`ansible-playbook prerequisites.yml zookeeper.yml mesos.yml spark.yml marathon.yml`

# Deploy nginx on top of Marathon

`ansible-playbook deploy_nginx.yml`

# Deploy Zeppelin on top of Marathon

`ansible-playbook deploy_zeppelin.yml`
