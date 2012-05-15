function put_dots_on() {
	lflag=no
	pflag=no
	flist=""
	set -- $(getopt lp "$@")
	while [ $# -gt 0 ]
	do
    	case "$1" in
    	(-l) lflag=yes;;
    	(-p) pflag=yes;;
    	(--) shift; break;;
    	(-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    	(*)  break;;
    	esac
    	shift
	done

	if [ -z $1 ]
	then
		echo "You must specify a host!"
		return 1
	fi

	REMOTE="$1"
	ssh "$REMOTE" -- gem -v 2>/dev/null
	HAS_GEM=$?

	if [ $HAS_GEM -ne 0 ] || [ "$pflag" = "yes" ] ;
	then
		# Do a primitive version of homesick:
		# 
		echo "RubyGems not installed on remote host."
		echo "Falling back to git + symlinks"
		# Wipe out an existing clone 	
		ssh "$REMOTE" -- rm -rf ~/.homesick
		ssh "$REMOTE" -- mkdir -p ~/.homesick/repos/
		if [ "$lflag" = "yes" ] ;
		then
			# SCP instead of github clone
			echo "Copying local castle instead of cloning..."
			scp -r ~/.homesick/repos/dotfiles "$REMOTE":~/.homesick/repos/
		else
			ssh "$REMOTE" -- git clone git://github.com/fxh32/dotfiles.git ~/.homesick/repos/dotfiles

			if [ $? -ne 0 ]; 
			then 
				echo "Failed to clone from github! Quitting..." 
				return 1 
			fi 
		fi

		ssh "$REMOTE" -- cp -as --remove-destination ~/.homesick/repos/dotfiles/home/* ~/
		ssh "$REMOTE" -- rm -rf ~/.git
		scp ~/.custom/* "$REMOTE":~/.custom/
		echo "Is this a dangerous machine? [Y/n]"
		read danger
		case "$danger" in
			y|Y) ssh "$REMOTE" -- "echo \"export PROMPT_STYLE='danger'\" > ~/.prompt_style"
				;;
			n|N) ssh "$REMOTE" -- "echo \"export PROMPT_STYLE='default'\" > ~/.prompt_style"
				;;
			*) echo "wat"
		esac
	else
		echo "RubyGems found"
		echo "Installing homesick and cloning..."
		
		THOR_GEM="/nail/home/fhats/sources/thor/thor-0.15.0.gem"

		# Setup a scratch directory remotely
		ssh $REMOTE mkdir -p ~/homesick_install
	
		if [ -e "$THOR_GEM" ]
		then
			# Get the gem onto the remote system
			scp $THOR_GEM $REMOTE:~/homesick_install/

			ssh $REMOTE gem install ~/homesick_install/thor-0.15.0.gem
		fi

		ssh $REMOTE gem install homesick

		ssh $REMOTE ~/.gem/ruby/1.8/bin/homesick clone git://github.com/fxh32/dotfiles.git

		ssh $REMOTE ~/.gem/ruby/1.8/bin/homesick symlink dotfiles
		
		ssh $REMOTE rm -rf ~/homesick_install
	fi

}
