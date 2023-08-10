# general
set -o vi
set show-all-if-ambiguous on
export BASH_ENV="~/.bashrc"
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s globstar
bind "\C-l":clear-screen
bind '"\C-o":"\eT d0iglobExpand \C-M\e\C-pelpbd0A"'

# fzf
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'


# aliases
alias vi='vi -u NONE -c "so ~/custom.vim"'
alias gl="git log --graph --oneline --decorate --color | tac | tr '\\/' '/\\'"
alias nl='nl -w1 -s" " -ba'
alias info="info --vi-keys"
alias flush="stdbuf -oL "
alias lscpu="lscpu | head -n 2; echo; lscpu -e=MODELNAME,CPU,CORE,SOCKET,MHZ,SCALMHZ%,MINMHZ,MAXMHZ"

# custom functions
gabbo() { cat ~/impegniGabriele.txt | grep "$1"; }
project() { find "$@" -type f | xargs nvim; }
filedate() { find "$2" | xargs -I {} ls -l "{}" | grep "$1" | sed "s/^.* //"; }
cdroot() { export rootdir=$(pwd); }
globExpand() { ls -1d $@ | sed "/:$\|^$/d"; }
# use it with rsync or fd -x
tot() { tot=$(($(tree -af "$@" | wc -l)-2)); }
bar() { nl -s"/$tot "; }
# rm() { ls -1d "$@" | xargs rm $1 | bar "$@"; }

# at startup
cdroot
clear
