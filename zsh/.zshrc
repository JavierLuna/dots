# jluna's ZSH config
# First, install antigen like this:
# curl -L git.io/antigen > .zsh/antigen.zsh
source $HOME/.zsh_aliases

source $HOME/.zsh/antigen.zsh
antigen init ~/.antigenrc

export POSSIBLE_ENV_NAMES=( "env" )

# Activate custom aliases if present
test -f $HOME/.zsh_custom_aliases && source $HOME/.zsh_custom_aliases

# Source and activate third party aliases/programs
eval $(thefuck --alias)
test -f $HOME/.fzf/shell/key-bindings.zsh && source ~/.fzf/shell/key-bindings.zsh

neofetch
