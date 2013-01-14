action :create do
  Array(new_resource.user).each do |user|
    user_dir = node["etc"]["passwd"][user]["dir"]

    link ::File.join(user_dir, ".oh-my-zsh") do
      to node[:oh_my_zsh][:install_dir]
      owner user
    end

    template ::File.join(user_dir, ".zshrc") do
      source new_resource.zshrc_source
      backup false
      owner user
      cookbook new_resource.zshrc_cookbook || node[:oh_my_zsh][:zshrc][:zshrc_cookbook]
      variables new_resource.zshrc_variables
      not_if { new_resource.skip_zshrc }
    end
  end
end
