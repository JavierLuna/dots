# jluna's ZSH config
test -f $HOME/.zsh/antigen.zsh || curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
export ZSH_CONFIG_DIR=$HOME/.config/zsh
source $ZSH_CONFIG_DIR/.zsh_aliases
source $ZSH_CONFIG_DIR/.zsh_env_vars
source $ZSH_CONFIG_DIR/.zsh_tools

# antigen
source $HOME/.zsh/antigen.zsh
antigen init $ZSH_CONFIG_DIR/.antigenrc

# Source platform-specific zsh if any
test -f $HOME/.zshrc_custom && source $HOME/.zshrc_custom

# Activate vim bindings
bindkey -v

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
else
  macchina
fi
