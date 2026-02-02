#!/bin/bash
# Ping sweep the Lab

pingsweep() {
	base="onyxnode"
	for q in {1..200}
	do
		curr="$base$q"
		ping -c 1 $curr >> ping.log
	done
}

help() {
   # Display Help
   echo "Usage: pingsweep.sh [options]"
   echo
   echo "Syntax: pingsweep.sh [-p|h]"
   echo "options:"
   echo "h     Print the help menu."
   echo "p     Run the pingsweep function."
   echo
}

# If no arguments were provided, show help and exit
if [ $# -eq 0 ]; then
   help
   exit 0
fi

# parse the command line options
while getopts "hp" option; do
   case $option in
	  h) # display help
		 help
		 ;;
	  p) # run pingsweep
		 pingsweep
		 ;;
	  *) # Invalid option
		 echo "Error: Invalid option"
		 help
		 exit;;
   esac
done