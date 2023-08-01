#!/bin/sh

case "$1" in 

	start)
		echo 'Loading AESDCHAR module'
		aesdchar_load
		;;
		
	stop)
		echo 'Unloading AESDCHAR module'
		aesdchar_unload
		;;
		
	*)
		echo "Usage: $0 {start|stop}"
		exit 1

esac

exit 0
