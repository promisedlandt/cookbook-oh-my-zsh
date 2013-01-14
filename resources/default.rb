actions :create

default_action :create

attribute :user, :kind_of => [String, Array], :name_attribute => true
attribute :zshrc_cookbook, :kind_of => String
attribute :zshrc_source, :kind_of => String, :default => "zshrc.erb"
attribute :zshrc_variables, :kind_of => Hash
attribute :skip_zshrc, :equal_to => [true, false], :default => false
