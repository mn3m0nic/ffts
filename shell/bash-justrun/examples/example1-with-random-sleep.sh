#!/bin/bash
source $PATH_TO_LIB/justrun-lib
CONC=32
SHOW=1
fork_body()
{
	if [ ! -z "$1" ]; then
		sleep $[ ( $RANDOM % 5 )  + 1 ]s
		echo $RANDOM
	fi
}
main "$@"
