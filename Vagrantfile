# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  { :name => :master01, :ip => '192.168.33.101'},
  { :name => :master02, :ip => '192.168.33.102'},
  { :name => :master03, :ip => '192.168.33.103'}
]

ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip

Vagrant.configure("2") do |config|

  boxes.each do |opts|

    config.vm.define opts[:name] do |foo|
      foo.vm.box = "ubuntu/trusty64"
      foo.vm.synced_folder "./", "/mnt/ansible/"
      foo.vm.network "private_network", ip: opts[:ip]

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
      end

      config.vm.provision "shell", inline: <<-SHELL
        echo #{ssh_pub_key} >> /home/ubuntu/.ssh/authorized_keys
      SHELL
    end
  end

end
