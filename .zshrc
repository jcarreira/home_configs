# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000000
SAVEHIST=2000000
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
export MPI_HOME=/opt/openmpi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/openmpi/lib:/usr/local/cuda/bin:/usr/local/lib/
export SVN_EDITOR=vim
export PATH=/data/joao/anaconda2/:/opt/openmpi/bin:usr/local/cuda/bin:/home/eecs/joao/bin/:$PATH
export PYTHONPATH=/data/joao/rllab/:$PYTHONPATH
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
alias mkea='make -j 12'
alias maek='make -j 12'
alias male='make -j 12'
alias mkae='make -j 12'
alias make='make -j 12'
alias htop='htop -s PERCENT_CPU'
alias moshsteropes='mosh joao@steropes.millennium.berkeley.edu'


COMPLETION_WAITING_DOTS="true"

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

