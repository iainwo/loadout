#!/usr/bin/env zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# load every completion after autocomplete loads
for file in $HOME/*.zsh
do
  source $file
done

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
#if [[ -a ~/.localrc ]]
#then
#  source ~/.localrc
#fi

# add vim support
# bindkey -v
# export KEYTIMEOUT=1
bindkey "^R" history-incremental-search-backward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=#d78700,bold,underline"
source "$HOME/.zsh-autosuggestions"
