#!/bin/bash

arg=0

if [ $# -eq 1 ]
then
	arg=$1
fi

cd buildroot

if [ $arg -eq 1 ] 
then
	echo "distclean buildroot"
	make distclean
else
	echo "clean buildroot"
	make clean
fi

cd ..

