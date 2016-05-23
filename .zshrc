# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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
export PROMPT='%d> '
export PATH=$PATH:/home/jc1/Desktop/tese/llvm-gcc-4.2-2.7.source/install/bin:/home/jc1/Klee/llvm-gcc4.2-2.9-x86_64-linux/bin:/opt/openmpi-1.8.3/bin/:/usr/local/spark/bin/pyspark
export GIT_EDITOR=vi

###########
# Aliases #
###########
alias sshvader1='ssh -C -X menezes@dslabpc47.epfl.ch'
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
alias bi='vi'
alias loginroot='ssh -i ~/.ssh/id_dsa_root -l root $(hostname)'
alias kqemu='pgrep qemu | xargs kill -9'
alias ktest='pgrep test | xargs kill -9'
alias lo='cd /local/'
alias fidn='find'
alias grpe='grep'
alias maek='make'
alias male='make'
alias mkae='make'

mkc () {
    mkdir -p "$@" && cd "$@"
}

ulimit -c unlimited

PROMPT='[%n@%m:%/]%# '

