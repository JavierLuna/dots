# dots
Collection of my own dot config files

## Useful commands

### Set terminal theme:

List:
`dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"`

Export:
`dconf dump /org/gnome/terminal/legacy/profiles:/:xx-xx-xx-xx/ > sample.dconf`

Import:

`dconf load /org/gnome/terminal/legacy/profiles:/:xx-xx-xx-xx/ < sample.dconf`


### Fonts

You should download:

#### Font awesome 5
`https://github.com/FortAwesome/Font-Awesome/tags`

#### System San Francisco Display
`https://github.com/supermarin/YosemiteSanFranciscoFont`
