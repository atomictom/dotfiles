Dotfiles
========

I feel that dotfiles are pretty personal. Each person is going to have their own
preferences, organization, way of doing things, etc., that is significantly
different from others'. This makes direct forking of dotfiles unlikely (at least
in my mind).

Rather, the benefit of sharing one's dotfiles, and the part that I enjoy, is
looking through them and finding those little gems that you really want to play
around with or try out. So, what I've done is to try and collect some of the
things I think are cool or worthwhile (my little gems =), to make it easier for
anyone looking for some cool code. Enjoy!

Cool Features
-------------

* GNU Screen hardstatus string:

	The status line looks like this:

	![Scrolling through the status line](https://github.com/atomictom/dotfiles/wiki/images/hardstatusline.gif)

	And the whole terminal when using it looks like this:

	![Scrolling through the terminal](https://github.com/atomictom/dotfiles/wiki/images/hardstatusline_terminal.gif)

	This string creates a cool bottom row scrolling "tab" effect. It
	highlights the current screen name (in red) and will scroll so that that
	screen and any surrounding ones are are visible. It also shows the
	current time and date on the far right which can be nice in a non-gui
	environment.

	Here's the format string to make this happen:

		"%{Ck}%-w%{=b kR}%50>%n %t%{-}%+w%-15=%{=b kG}|%d/%m/%y %C"


* PS1 Prompt:

	![Multiple lines in bash showing features of my PS1 prompt](https://github.com/atomictom/dotfiles/wiki/images/ps1-features.png)

	This is an expanded version of what comes with Ubuntu. It includes
	virtualenv information, git branch and status information, and command
	exit code information. However, perhaps the best part is not what it
	provides, but how it works.

	I designed my PS1 to be easy to extend and improve upon. For one, I use
	PROMPT_COMMAND so that I can run a function allowing me to more easily
	collect information and organize my code. Also, I include the terminal
	colors and brightness as variables so that you can specify the color by
	name rather than having to know the code. Furthermore, each "feature" of
	the prompt is setup into a separate variable; at the end, I just
	concatenate all those variables together to get the prompt. The benefit
	here is that when I look at the PS1 assignment, I can see what all the
	parts and their orderings are without worrying about the details of how
	they work.  Then, if I want to inspect how a particular feature works, I
	can look at it in isolation. For example, When I recently added support
	for showing the virtualenv I'm working in if there is one, it was easy
	to add a section for creating a "virtualenv_name" variable and then
	simply putting that into the PS1 concatenation.

	If you are interested, here is the code at the time of writing:

		# Set the prompt
		set_prompt_vars(){
		    ret=$?

		    # Forground Colors
		    black="\[$(tput setaf 0)\]"
		    red="\[$(tput setaf 1)\]"
		    green="\[$(tput setaf 2)\]"
		    yellow="\[$(tput setaf 3)\]"
		    blue="\[$(tput setaf 4)\]"
		    magenta="\[$(tput setaf 5)\]"
		    cyan="\[$(tput setaf 6)\]"
		    white="\[$(tput setaf 7)\]"

		    # Attributes
		    bold="\[$(tput bold)\]"
		    dim="\[$(tput sgr0)\]"

		    # Exit will set the return code for $(returncode) to read
		    # Without this, returncode will return the status of the line before it
		    $(exit $ret)
		    local return_code="$dim$red"$(returncode)
		    if [ -z "$VIRTUAL_ENV" ]; then
			local virtualenv_name=""
		    else
			local virtualenv_name="$bold$green($(basename "$VIRTUAL_ENV"))"
		    fi
		    if git rev-parse --git-dir >/dev/null 2>&1; then
			if ! git diff-index --quiet --cached HEAD 2>/dev/null || ! git diff-files --quiet; then
			    local git_branch_color="$dim$red"
			elif git ls-files --other --exclude-standard --error-unmatch . >/dev/null 2>&1; then
			    local git_branch_color="$dim$yellow"
			else
			    local git_branch_color="$dim$green"
			fi
		    fi
		    local git_branch="$git_branch_color"$(__git_ps1|tr -d " ")
		    local chroot="$dim$magenta"${debian_chroot:+($debian_chroot)}
		    if [[ ${EUID} == 0 ]] ; then # If root
			local username_host_dir="$bold$red\h$bold$blue \W"
			local prompt="$dim$cyan\$ "
		    else
			local username_host_dir="$dim$magenta\u@\h$dim$white:$dim$cyan\w"
			local prompt="$dim$cyan> "
		    fi
		    local unmodify_color='\[\033[0;00m\]'
		    local screen_hack='\[\033k\033\\\]'
		    local end_prompt=$unmodify_color$screen_hack

		    export PS1="$return_code$virtualenv_name$chroot$username_host_dir$git_branch $prompt$end_prompt"
		    return $ret
		}
		export PROMPT_COMMAND="set_prompt_vars"

