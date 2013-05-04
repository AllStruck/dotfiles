SSH_PROXY_ARGS='ssh -f -anN -D 41792'
alias proxy-on="$SSH_PROXY_ARGS "
alias proxy-off="pkill -f '$SSH_PROXY_ARGS'"
