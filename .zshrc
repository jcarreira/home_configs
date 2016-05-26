
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/jc1/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ll='ls -l'
alias rm='rm -i'
export SVN_EDITOR=vim
export PROMPT='%d> '

alias sshvader1='ssh -C -X menezes@dslabpc47.epfl.ch'

alias sl='ls'
alias ls='ls -G'
alias grpe='grep'
alias maek='make'
alias male='make'
alias make='make'
alias s='ls'
alias z='ls -l'
alias psmen='ps aux | grep menezes'

export PATH=$PATH:/home/jc1/Desktop/tese/llvm-gcc-4.2-2.7.source/install/bin:/home/jc1/Klee/llvm-gcc4.2-2.9-x86_64-linux/bin

alias fname='find * -name'
alias grep='grep --color'
alias grpe='grep --color'
alias gerp='grep --color'
alias bi='vi'
alias films='cd /home/jc1/.wine/drive_c/windows/profiles/root/My\ Documents'
alias sl='ls'
alias l='ls'
alias loginroot='ssh -i ~/.ssh/id_dsa_root -l root $(hostname)'
alias kqemu='pgrep qemu | xargs kill -9'
alias ktest='pgrep test | xargs kill -9'
alias lo='cd /local/'
alias fidn='find'
alias sshhome='ssh jcmcarreira@107.180.26.78'
alias sshfbox='ssh -X joao@fbox.millennium.berkeley.edu'
alias moshfbox='mosh joao@fbox.millennium.berkeley.edu'
alias sshjc1='ssh -X jc1@192.168.0.104'

mkc () {
        mkdir -p "$@" && cd "$@"
}

export GIT_EDITOR=vi
ulimit -c unlimited


PERL_MB_OPT="--install_base \"/Users/joao/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/joao/perl5"; export PERL_MM_OPT;

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

plugins=(git copyzshell)

PROMPT='[%n@%m:%/]%# '
PROMPT='${ret_status}%{$fg_bold[green]%}%p %n@%m %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %D %T % %{$reset_color%}'

tldr --random
