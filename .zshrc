# jluna's ZSH config
# First, install antigen like this:
# curl -L git.io/antigen > .zsh/antigen.zsh
source $HOME/.zsh_aliases

source $HOME/.zsh/antigen.zsh
antigen init ~/.antigenrc

export POSSIBLE_ENV_NAMES=( "env" )

if [ -e "$HOME/.zsh_custom_aliases" ]; then
    source $HOME/.zsh_custom_aliases
fi


neofetch
