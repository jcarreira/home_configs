# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jc1/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###########
# Exports #
###########
export MPI_HOME=/opt/openmpi-1.8.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/openmpi/lib
export SVN_EDITOR=vim
#export PROMPT='%d> '
#source ~/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '
export PATH=$PATH:/opt/openmpi-1.8.3/bin/
export GIT_EDITOR=vi

###########
# Aliases #
###########
alias ll='ls -l'
alias sl='ls'
alias ls='ls --color'
alias s='ls'
alias l='ls'
alias rm='rm -i'
alias fname='find * -name'
alias grep='grep --color'
alias grpe='grep --color'
alias gerp='grep --color'
alias greo='grep --color'
alias bi='vi'
alias loginroot='ssh -i ~/.ssh/id_dsa_root -l root $(hostname)'
alias kqemu='pgrep qemu | xargs kill -9'
alias ktest='pgrep test | xargs kill -9'
alias lo='cd /local/'
alias fidn='find'
alias grpe='grep'
alias maek='make -j 8'
alias male='make -j 8'
alias mkae='make -j 8'
alias make='make -j 8'
alias htop='htop -s PERCENT_CPU'

mkc () {
    mkdir -p "$@" && cd "$@"
}

ulimit -c unlimited

# dont use this now
# autoload -Uz vcs_info
# precmd () { vcs_info }
# setopt prompt_subst
# PS1="%n@%m:%/ \$vcs_info_msg_0_"

PROMPT='[%n@%m:%/]%# '
