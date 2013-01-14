#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
# Copyright (C) 2013 Nils Landt
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git" unless node[:oh_my_zsh][:skip_git_installation]
include_recipe "zsh" unless node[:oh_my_zsh][:skip_zsh_installation]

directory node[:oh_my_zsh][:install_dir] do
  mode "0755"
  recursive true
end

git node[:oh_my_zsh][:install_dir] do
  repository node[:oh_my_zsh][:git][:url]
  reference node[:oh_my_zsh][:git][:sha]
  action :sync
end
