# my aliases
alias l="ls"
alias vi="vim"
alias v="vim"
alias xx="sudo"
alias Less="less"
alias ill="cd ~/sites"
alias lorum="cat ~/lorum_ipsum|less"
alias mygpg="gpg -c --force-mdc"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias search-php="firefox http://php.net/${1}"
alias pingrouter="ping -i .2 192.168.1.1"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# connect to db
alias sqlsh="sqlsh.sh"
alias db="sqlsh.sh"

# some mysqldump quickies
alias getdb="mysqldump -u root -p"
alias getdb-data="mysqldump -c -n -t -u root -p"
alias getdb-structure="mysqldump -d -u root -p"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias ..='cd ..'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# read a private bash alias if exists
# useful when aliases exist to things which shouldn't
# be in public repo
if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
