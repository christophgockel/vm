directory = '/home/vagrant/.ruby-build'

git directory do
  user 'vagrant'
  group 'vagrant'
  repository 'https://github.com/sstephenson/ruby-build.git'
  checkout_branch 'master'
  enable_checkout false
  action :sync
end

execute 'ruby-build: installing' do
  cwd directory
  command './install.sh'
  not_if 'which ruby-build'
end
