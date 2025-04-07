# jluna's ZSH config
export ZSH_CONFIG_DIR=$HOME/.config/zsh
source $ZSH_CONFIG_DIR/.zsh_aliases
source $ZSH_CONFIG_DIR/.zsh_env_vars
source $ZSH_CONFIG_DIR/.zsh_tools

# antidote
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote
source ~/.antidote/antidote.zsh
antidote load # Plugins are located in ~/.zsh_plugins.txt and compiled in the equivalent .zsh file


# Source platform-specific zsh if any
test -f $HOME/.zshrc_custom && source $HOME/.zshrc_custom

# Activate vim bindings
bindkey -v

eval "$(/opt/homebrew/bin/brew shellenv)"

macchina

