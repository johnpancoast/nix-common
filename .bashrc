export PATH=$PATH:~/.composer/vendor/bin

export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

source ~/.bash_git

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
else
    source ~/git-completion.bash
fi

if [ -f ~/.console_completion ]; then
    source ~/.console_completion
fi

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 '%s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[$(hg branch)]"
    fi
}

#Terminal Prompt Colors
black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
export PS1='\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\[$reset\]\$ '

# ls colors
[ "$TERM" = "xterm" ] && TERM="xterm-256color"
alias ls='ls --color'

# Aliases!
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If MacVim is installed, use that
if [[ -e /usr/bin/mvim || -e /usr/local/bin/mvim || -e /bin/mvim ]]; then
    alias vi="mvim $1"
fi

#screen -ls
