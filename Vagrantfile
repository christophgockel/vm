# vim: set ft=ruby:

Vagrant.configure('2') do |config|
  config.vm.box = 'vm'

  config.ssh.forward_agent    = true
  config.ssh.private_key_path = 'packer/keys/vm'

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "vim"
    chef.add_recipe "tmux"
    chef.add_recipe "dotfiles"
    chef.add_recipe "zsh"
    chef.add_recipe "chruby"
  end

#  config.vm.provider :virtualbox do |vb|
#    vb.gui = true
#  end
end

