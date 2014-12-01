include_recipe 'chocolatey'
chocolatey 'javaruntime'

directory "#{ENV['programdata']}/minecraft"

remote_file "#{ENV['programdata']}/minecraft/minecraft_server.jar" do
  source "https://s3.amazonaws.com/Minecraft.Download/versions/#{node['minecraft']['version']}/minecraft_server.#{node['minecraft']['version']}.jar"
end

cookbook_file "minecraft.bat" do
  path "#{ENV['programdata']}/minecraft/minecraft.bat"
end

batch "start minecraft" do
  code <<-EOH
    powershell -command "start #{ENV['programdata']}/minecraft/minecraft.bat"
    EOH
  action :run
end