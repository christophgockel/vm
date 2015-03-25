apt_package 'zsh'

execute 'set zsh as default shell' do
  command "sudo chsh -s $(which zsh) vagrant"
  not_if 'getent passwd vagrant | grep zsh'
end
