Thomas Manning's dotFiles
=========================

Cool Features
-------------

* GNU Screen hardstatus string:

        The hardstatus string:
		"%{Ck}%-w%{=b kR}%50>%n %t%{-}%+w%-15=%{=b kG}|%d/%m/%y %C"
	creates a cool bottom row scrolling "tab" effect. It highlights the current
	screen name (as red) and will scroll so that screen and surrounding ones are
	always showing. It also shows the current time and date on the far right as
	kind of a gimmick.

	The status line looks like this:
	![Scrolling through the status line](https://github.com/atomictom/dotfiles/wiki/images/hardstatusline.gif)
