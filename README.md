# dots
Collection of my own dot config files

```
dunst	    > Notification manager
alacritty   > GPU accelerated terminal
git         > Git configuration
i3          > Tiling window manager
polybar     > Status bar
rofi        > App launcher
nvim        > Neovim editor config
sardine     > Sardine configuration
vim         > Vim editor config
zsh         > Zsh config and plugins
```


## Usage
I use [stow](https://www.gnu.org/software/stow/) to manage my dotfiles:

```
git clone https://github.com/JavierLuna/dots.git ~/.dotfiles
cd ~/.dotfiles
git checkout ubuntu # ...If you want to use a specific config, if not leave as is
stow zsh # ...and whatever else you want
```

## Branches

There's a branch for each OS I use where its .config files are located.

At the moment, those are:
```
ubuntu
void
macos
```

### Ubuntu

I use Ubuntu mainly for my work laptop. In addition, I think Ubuntu is better for a professional workstation as it is more stable than others (for example my new fav `void`).

### Void

For my main and personal workstation I'm currently using Void Linux. Void linux is a minimal distro made from the ground up, and I love it!

### MacOs

My personal laptop is a 2013 Macbook Pro and I like it a lot. I usually use linux for programming, but I find my macbook really pleasing to use!

### Fonts

You should download:

#### Font awesome 5
`https://github.com/FortAwesome/Font-Awesome/tags`

#### System San Francisco Display
`https://github.com/supermarin/YosemiteSanFranciscoFont`

#### Adobe Source Code Pro
`https://github.com/adobe-fonts/source-code-pro`

#### SF Mono Powerline
`https://github.com/Twixes/SF-Mono-Powerline`
