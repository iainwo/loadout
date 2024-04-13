#!/usr/bin/env zsh

export DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/env/install.sh"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# load every completion after autocomplete loads
for file in $DOTFILES_DIR/**/*.zsh
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
source $ZSH_AUTOSUG

path+=($TOOLS_NVIM)
export PATH

export PATH=$PATH:/usr/local/go/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

