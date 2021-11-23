zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/icat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

#Make ls always use colors
alias ls='ls --color=auto'

#Up arrow matches already written command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^K" up-line-or-beginning-search # Up
bindkey "^J" down-line-or-beginning-search # Down

export PATH=$PATH:$HOME/bin

function precmd(){ echo -n "\033]0;${PWD/#$HOME/~}\007" }

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $HOME/.keychain/icat-sh

gitclone() {
        git clone https://gitlab.com/znhs/$1.git
}

gitadd() {
        git remote add origin https://gitlab.com/znhs/$1.git
}

gitp() {
        git push origin master
}
