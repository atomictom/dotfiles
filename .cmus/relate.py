#!/usr/bin/python

import re
import sys

def parse_line(line):
	first_comment = line.find("#")
	line = line[:first_comment]

	match = re.match(r'(.*) -> (.*)', line)
	if match:
		pusher = match.group(1)
		pushed = match.group(2)

		try:
			with open(pusher) as f1, open(pushed) as f2:
				pusher_set = set(f1.readlines())
				pushed_set = set(f2.readlines())
		except IOError as e:
			print e
			print "Invalid relations.txt -- exiting"
			sys.exit(1)

		print match.group(0)
		print "-----------------------------------"
		with open(pushed, 'a') as out:
			print "".join(pusher_set - pushed_set)
			out.writelines(pusher_set - pushed_set)
		print

with open("/home/thomas/.cmus/relations.txt") as f:
	lines = f.readlines()

for line in lines:
	parse_line(line)
