alias cdprojects="cd ~/Documents/_projects"
alias cdgangplank="cd ~/Documents/_projects/_gangplank"
alias cdallstruck="cd ~/Documents/_projects/_allstruck"

alias lime="subl"

alias webserverhere="python -m SimpleHTTPServer 8000"

alias 'cdp'='cdprojects'
alias 'cdg'='cdgangplank'
alias 'cda'='cdallstruck'

alias ssharchimedes="ssh -l root archimedes"
alias sshmckay="ssh -l root mckay -p 42123"
alias sshcooper="ssh -l root cooper"
alias sshcarter="ssh -l root carter"
alias sshfleinhardt="ssh root@fleinhardt"
alias sshgpfeeds="ssh pi@172.16.25.202"
alias sshgpphones="ssh root@172.16.0.60"

alias sshwptc="ssh -l root 166.78.14.194"

alias dude="echo 'You receive a rug that really brings the room together.'"
alias dnsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias flushdns="dnsflush"

if [ -f "/usr/local/bin/brew" ]; then
    alias apt-get="brew"
fi

#alias "sudo brew"="brew"

alias oncarter="fab -H carter"
alias oncooper="fab -H cooper"
alias onmckay="fab -H mckay"
alias onarchimedes="fab -H archimedes"
alias onclients="fab -H allstruckclients"