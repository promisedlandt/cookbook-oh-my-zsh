name             "oh_my_zsh"
maintainer       "Nils Landt"
maintainer_email "cookbooks@promisedlandt.de"
license          "All rights reserved"
description      "Installs/Configures oh-my-zsh"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "git"
depends "zsh"

