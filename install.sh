#!/usr/bin/env sh

# Installation script for config-nvim

omarchy_install() {
  # With Omarchy, it is possible to switch the theme so we just
  # need to point the theme.lua to whatever Omarchy is using
  echo "This is Arch Linux."
  if [ -f ~/.config/omarchy/current/theme/neovim.lua ]; then
    echo "This is Omarchy"
    if [ -L lua/plugins/theme.lua ]; then
      echo "config-nvim has already been installed"
    else
      if [ -f lua/plugins/theme.lua ]; then
        echo "Removing hard-coded theme"
        rm lua/plugins/theme.lua
      fi
      echo "Creating the link"
      ln -s ~/.config/omarchy/current/theme/neovim.lua lua/plugins/theme.lua
    fi
  else
    echo "It looks like Omarchy has not been installed"
  fi
}

non_omarchy_install() {
  # For everything else non-Omarchy, simply use the default theme
  echo "This is not Omarchy - using default theme"
  cp lua/plugins/theme.lua.default lua/plugins/theme.lua
}

point_neovim_to_this_config() {
  echo "Pointing neovim to this config"
  if [ -L ~/.config/nvim ]; then
    echo "Neovim config already set - verifying it points to this config"
    local actual_resolved_path
    actual_resolved_path=$(readlink -f ~/.config/nvim)
    if [ "$actual_resolved_path" = "$(pwd)" ]; then
      echo "Neovim is already pointing to this config"
    else
      echo "Neovim is pointing to another config: ${actual_resolved_path}"
      exit 1
    fi
  else
    if [ -d ~/.config/nvim ]; then
      echo "Neovim config already exists - moving it to backup"
      mv ~/.config/nvim{,.bak}
    else
      echo "Linking neovim to this config"
      ln -s ~/repos/config-nvim ~/.config/nvim
    fi
  fi
}

main() {

  if [ -d lua/plugins ]; then
    if [ -f /etc/arch-release ]; then
      omarchy_install
    else
      non_omarchy_install
    fi
    point_neovim_to_this_config
  else
    echo "You need to run this script from within the config-nvim directory"
  fi
}

main
