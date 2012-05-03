## Prompt custom configuration
# Generate colors via
# $ for i in {0..256}; do tput setaf $i && echo $i; done | column

# Possible styles:
# * default
# * none (use to overide with your own colors or use the default default ones)
# * danger
# * noroot

PROMPT_STYLE="default"

if [ -e ~/.prompt_style ]
then
	source ~/.prompt_style
fi

case "$PROMPT_STYLE" in
'default')	
			export PROMPT_USER_COLOR=$(tput setaf 119)
			export PROMPT_HOST_COLOR=$(tput setaf 123)
			export PROMPT_DIR_COLOR=$(tput setaf 227)
			export PROMPT_GIT_COLOR=$(tput setaf 166)
;;
'danger')
			export PROMPT_USER_COLOR=$(tput setaf 190)
			export PROMPT_HOST_COLOR=$(tput setaf 160)
			export PROMPT_DIR_COLOR=$(tput setaf 197)
			export PROMPT_GIT_COLOR=$(tput setaf 131)
;;
'noroot')
			export PROMPT_USER_COLOR=$(tput setaf 23)
			export PROMPT_HOST_COLOR=$(tput setaf 26)
			export PROMPT_DIR_COLOR=$(tput setaf 58)
			export PROMPT_GIT_COLOR=$(tput setaf 131)
esac
