# jluna's ZSH config
# First, install antigen like this:
# curl -L git.io/antigen > .zsh/antigen.zsh
export ZSH_CONFIG_DIR=$HOME/.config/zsh
source $ZSH_CONFIG_DIR/.zsh_aliases
source $ZSH_CONFIG_DIR/.zsh_env_vars
source $ZSH_CONFIG_DIR/.zsh_completions

# antigen
source $HOME/.zsh/antigen.zsh
antigen init $ZSH_CONFIG_DIR/.antigenrc

# Source platform-specific zsh if any
test -f $ZSH_CONFIG_DIR/.zshrc_custom && source $ZSH_CONFIG_DIR/.zshrc_custom

# Activate vim bindings
bindkey -v

neofetch
