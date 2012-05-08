alias i=ipython
alias infinigrep='grep -ir'
alias ls='ls -ah'

# Pipe input to me to have pretty-printed json-decoded output
alias nicejson='python -c "import pprint
import json
import sys
while True:
    pprint.pprint(json.loads(sys.stdin.readline()))
"'
