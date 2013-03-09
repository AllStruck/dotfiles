alias i=ipython
alias infinigrep='grep -ir'

LS_OPTS='-ah'
if [ $(uname) == "Linux" ]; then
	LS_OPTS="$LS_OTPS --color=always"
fi

alias ls="ls $LS_OPTS"

# I use git a lot
alias gut='git'
alias gt='git'
alias gti='git'
alias g='git'
alias got='git'

# Pipe input to me to have pretty-printed json-decoded output
alias nicejson='python -c "import pprint
import json
import sys
while True:
    pprint.pprint(json.loads(sys.stdin.readline()))
"'
