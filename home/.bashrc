## CONFIGURATION

# Desired prompt (in .prompts)
PROMPT_SCRIPT="sexy_prompt.bash"

# FIX for SFTP not dealing with color, multi-line prompts
# -.- wtf
if [ ${TERM} == "dumb" ]; then
	PROMPT_SCRIPT=".color_term_with_git.bash"
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
ALIAS_FILES=".alias/*.bash"
for alias_file in $ALIAS_FILES
do
	source $alias_file
done

# Load up all the completion extensions
COMPLETERS=".completion/*.bash"
for completer in $COMPLETERS
do
	source $completer
done

source .exports

# Load the prompt of choice
source .prompts/$PROMPT_SCRIPT

MISC=".misc/*.bash"
for misc in $MISC
do
	source $misc
done

# Load up any custom scripts
CUSTOM=".custom/*.bash"
for custom in $CUSTOM
do
	source $custom
done
