apt_package 'zsh'

execute 'set zsh as default shell' do
  command "sudo chsh -s $(which zsh) vagrant"
end
