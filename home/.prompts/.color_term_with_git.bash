export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1 " \[\e[1;36m\](%s)\[\e[0;39m\] ")\$ '
export PS1
export -f __git_ps1

