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
