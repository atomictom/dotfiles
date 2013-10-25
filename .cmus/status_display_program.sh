#!/bin/bash

# Make an associative array named 'data'
declare -A data

# Load the arguments in the form 'key value key value' into the data
# associative array. (ex. 'album beatles song yellow_submarine')
while (( $# ))
do
	data["$1"]="$2"
	shift 2
done

# Add file info to a 'history' list
echo "${data[file]}" >> /home/thomas/.cmus/history.pl

# Use notify-send to show file info...
output="${data[title]} \nby: ${data[artist]}"

# If the artist and title are the same, only use one
if [[ ${data[artist]} = ${data[title]} ]]
then 
	output="${data[title]}"
	# However, if being the same means they are both empty, use the filename
	if [[ -z ${data[title]} ]] 
	then
		echo oops > /tmp/cmuslog
		output=${data[file]}
	fi
fi	

# All the spaces after 'Now Playing' avoid notify-send putting a 'preview'
# of the body on the title line (annoying...). 
notify-send -u low \
 -i weather-storm \
 "Now Playing:                                                               "\
 "<b>$output</b>" 
