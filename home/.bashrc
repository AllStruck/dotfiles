## CONFIGURATION

# Desired prompt (in .prompts)
PROMPT_SCRIPT="sexy_prompt.bash"

# FIX for SFTP not dealing with color, multi-line prompts
# -.- wtf
if [ ${TERM} == "dumb" ] || [ ${TERM} == "screen" ]; then
	PROMPT_SCRIPT=".color_term_with_git.bash"
	return 0
fi

## ACTION

# Don't blow up if a directory is empty
shopt -s nullglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Turn on dotglob so the globs below will match .bash scripts beginning
# with dots.
shopt -s dotglob

# Load up all of the aliases
ALIAS_FILES="$HOME/.alias/*.bash"
for alias_file in $ALIAS_FILES
do
	source $alias_file
done

# Load up all the completion extensions
COMPLETERS="$HOME/.completion/*.bash"
for completer in $COMPLETERS
do
	source $completer
done

# Load bash completions:
if [ -f  /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion
fi



source $HOME/.exports

# Load the prompt of choice
source $HOME/.prompts/$PROMPT_SCRIPT

MISC="$HOME/.misc/*.bash"
for misc in $MISC
do
	source $misc
done

# Load up any custom scripts
CUSTOM="$HOME/.custom/*.bash"
for custom in $CUSTOM
do
	source $custom
done

shopt -u nullglob

# Add ~/bin to the PATH
export PATH=$PATH:~/.bin:~/packer:/usr/local/packer:/usr/local/sbin

# Add WP-CLI to PATH
    export PATH=/root/.wp-cli/bin:$PATH