## config-nvim

This Neovim config originated from LazyVim as part of the Omarchy installation. 
Omarchy adds a couple of tweaks to the LazyVim starter config. Specifically, 
Omarchy adds theme switching.

I use Neovim across all of my machines (Omarchy and macOS) - and I want as much as 
consistent experience as possible. 

See [LazyVim](https://github.com/LazyVim/LazyVim) for more details.

### Installation on Omarchy

For Omarchy, I want Neovim to pick up the current theme so run this command

    ln -s ~/.config/omarchy/current/theme/neovim.lua lua/plugins/theme.lua

As you switch the theme in Omarchy, for the changes to take effect you
need to re-launch neovim.

### Installation on macOS

A hard-coded theme is used because there is no theme switching on macOS.

On initial clone of the repo for a non-Omarchy machine, simply copy the 
lua/plugins/theme.lua.default to lua/plugins/theme.lua.

Then, assuming this repo has been cloned into ~/repos, simply create this
link:

    ln -s ~/repos/config-nvim ~/.config/nvim

