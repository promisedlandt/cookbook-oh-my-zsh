# oh_my_zsh

Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

Clones the oh-my-zsh git repository to a central location on the system, then symlinks it to user directories.

# Examples

    # Set up oh-my-zsh for user "vagrant" using the LWRP.
    # Since we didn't set up the zshrc in any way, it will be empty
    include_recipe "oh_my_zsh"
    oh_my_zsh "vagrant"


    # This is how you might include this cookbook in a wrapper cookbook called "my_oh_my_zsh"
    # for two users with their respective zshrc templates
    node.set[:oh_my_zsh][:zshrc][:zshrc_cookbook] = "my_oh_my_zsh"
    include_recipe "oh_my_zsh"

    oh_my_zsh "vagrant" do
      zshrc_source "vagrant_zshrc.erb"
    end

    oh_my_zsh "nils" do
      zshrc_source "nils_zshrc.erb"
    end

# Recipes

## oh_my_zsh::default

Installs git and zsh and clones the oh-my-zsh git repository.

# Resources / Providers

## oh_my_zsh

### Actions

### Attributes

Attribute | Description | Type | Default
--------- | ----------- | ---- | -------
user | Name of the user to setup zsh for. Can be an Array of Strings | String or Array | name
zshrc_cookbook | Name of the cookbook that provides a zshrc template | String | nil
zshrc_source | Name of the erb template to use | String | zshrc.erb
zshrc_variables | Variables to be passed to the template | Hash | nil
skip_zshrc | Skip zshrc creation altogether | Boolean | false

# Attributes

## default

Attribute | Description | Type | Default
--------- | ----------- | ---- | -------
install_dir | Directory to install to - user installations are symlinked to here | String | /usr/src/oh-my-zsh
skip__git_installation | Skip installing git | Boolean | false
skip__zsh_installation | Skip installing zsh | Boolean | false

## git

Attribute | Description | Type | Default
--------- | ----------- | ---- | -------
url | URL of the git repo you want to install from | String | https://github.com/robbyrussell/oh-my-zsh.git
sha | Use if you want to install a specific revision | String | master

## zshrc

Attribute | Description | Type | Default
--------- | ----------- | ---- | -------
zshrc_cookbook | Name of the cookbook that provides a zshrc.erb template | String | oh_my_zsh
