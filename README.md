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

		"%{Ck}%-w%{=b kR}%50>%n %t%{-}%+w%-15=%{=b kG}|%d/%m/%y %C"
	This string creates a cool bottom row scrolling "tab" effect. It
	highlights the current screen name (in red) and will scroll so that that
	screen and any surrounding ones are are visible. It also shows the
	current time and date on the far right which can be nice in a non-gui
	environment.

	The status line looks like this:

	![Scrolling through the status line](https://github.com/atomictom/dotfiles/wiki/images/hardstatusline.gif)

	And the whole terminal when using it looks like this:

	![Scrolling through the terminal](https://github.com/atomictom/dotfiles/wiki/images/hardstatusline_terminal.gif)
