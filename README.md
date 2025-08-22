## config-nvim

This Neovim config originated from LazyVim as part of the Omarchy installation. 
Omarchy adds a couple of tweaks to the LazyVim starter config. Specifically, 
Omarchy adds theme switching.

I use Neovim across all of my machines (Omarchy and macOS) - and I want as much as 
consistent experience as possible. 

I have tweaked the LazyVim starter slightly to my taste.

### Keybindings 

Not an exhaustive list - see [LazyVim keymaps](https://www.lazyvim.org/keymaps) for a more comprehensive list.

"\<leader\>" = Space

| Key | Description |
|---|---|
| gd | Goto definition |
| gr | Find references |
| s | Restored to original vim behavior e i.e. substitute instead of flash.nvim |
| "+yy | Yank to system clipboard|
| \<leader\>td | Toggle lsp diagnostics on/off |
| \<leader\>gg | Launch Lazygit |
| \<leader\>e | Toggle explorer |
| \<leader\>/ | Grep for files |
| \<leader\>ff | Fuzzy find file open |
| \<leader\>, | Switch buffer |
| \<leader\>\| | Split window right |
| \<leader\>- | Split window below |
| \<leader\>wd | Delete window |
| \<leader\>bd | Delete buffer |
| \<leader\>ft | Open terminal |
| \<leader\>uz | Toggle Zen mode |
| :Mason | Manage LSP Servers |
| :checkhealth | Checkhealth |

#### Vim motions handy reference

0 Jump to start of line
$ Jump to end of line
f Find character (stop at before) on line forward
F Find character on line reverse
t Find character (stop just before) on line forward
T Find character on line reverse
; to go forwards
, to go backwards
w Jump to next word
e Jump to end of word
b Jump to previous word
W Variation of w
E Variation of e
B Variation of b
{ Paragraph forward
} Paragraph backward
zz Shift current line to center
[ ( Find opening brace 
* search for current word


### Installation 

    ./install.sh

