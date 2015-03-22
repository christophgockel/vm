dotfile_directory = '/home/vagrant/.dotfiles'

git dotfile_directory do
  user 'vagrant'
  group 'vagrant'
  repository 'https://github.com/christophgockel/dotfiles.git'
  checkout_branch 'master'
  enable_checkout false
  action :sync
end

execute 'install dotfiles: base16' do
  user 'vagrant'
  group 'vagrant'
  environment 'HOME' => '/home/vagrant'
  cwd dotfile_directory
  command 'sh base16/install.sh'
end

execute 'install dotfiles: vim - pathogen' do
  user 'vagrant'
  group 'vagrant'
  environment 'HOME' => '/home/vagrant'
  cwd dotfile_directory
  command 'sh vim/install_pathogen.sh'
end

execute 'install dotfiles: vim - plugins' do
  user 'vagrant'
  group 'vagrant'
  environment 'HOME' => '/home/vagrant'
  cwd dotfile_directory
  command 'ruby vim/update_plugins.rb'
end

execute 'install dotfiles: linking resource files' do
  user 'vagrant'
  group 'vagrant'
  environment 'HOME' => '/home/vagrant'
  cwd dotfile_directory
  command 'sh create_symlinks.sh'
end
