#
# Set PATH for Postgres.app
#
file_name   = "/etc/paths"
file        = File.read(file_name)
first_line  = File.open(file_name, &:readline)
insert_line = "/Applications/Postgres.app/Contents/Versions/9.3/bin\n"

ruby_block "Set PATH for Postgres.app" do
  block do
    File.open(file_name, 'w') do |f|
      f.puts(insert_line)
      f.puts(file)
    end
  end
  action :create
  only_if { first_line.chomp != insert_line.chomp }
end

%w{ bash_profile zshenv }.each do |f|
  cookbook_file "#{ENV['HOME']}/.#{f}" do
    source f
    owner node["rbenv"]["user"]
    group "staff"
    not_if { File.exists?("#{ENV['HOME']}/.#{f}") }
  end
end

cookbook_file "#{ENV['HOME']}/.gitconfig" do
  source "gitconfig"
  owner node["rbenv"]["user"]
  group "staff"
  not_if { File.exists?("#{ENV['HOME']}/.gitconfig") }
end
