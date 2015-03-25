version   = '0.3.9'
archive   = "chruby-#{version}.tar.gz"
url       = "https://github.com/postmodern/chruby/archive/v#{version}.tar.gz"

bash 'chruby: installing' do
  directory = archive.sub('.tar.gz', '')

  user 'root'
  cwd '/tmp'

  code <<-EOH
    wget -O #{archive} #{url}
    tar -zxf #{archive}
    cd #{directory}
    make install
  EOH

  not_if { ::File.exists?('/usr/local/share/chruby/chruby.sh') }
end
