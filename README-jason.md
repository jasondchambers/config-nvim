This nvim config originated from LazyVim. Omarchy adds a couple of tweaks to it.
Specifically, Omarchy adds theme switching - this is performed via a symbolic link.

I use neovim across all of my machines (Omarchy and macOS) - and I want as much as 
consistent experience as possible. For non-Omarchy machine, I use a hard-coded theme.
On initial clone for a non-Omarchy machine, simply move the 
lua/plugins/theme.lua.<machine> to lua/plugins/theme.lua.

Then, assuming this repo has been cloned into ~/repos, simply 

ln -s ~/repos/config-nvim ~/.config/nvim
