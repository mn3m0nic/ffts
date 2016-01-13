#!/bin/bash
# Simple parallel BASH programming without any binary in solo 1 script
# without needing to install any additional packages like GNU parallel
# or GNU make
# Authors: Nick Void https://github.com/mn3m0nic
#
# For testing just start:
# ./run aaa bbb ccc
#
# Description:
# Current script ./run can be used for running some shell code in parallel
# with outputing result of work to files in some $OUT dir.
#
# Example:
# $./run aaa bbb ccc ddd eee ffffff ggg ssss 000 2222
# $tree
# ├── out
# │   ├── run_000_at_20160113185410.txt
# │   ├── run_2222_at_20160113185411.txt
# │   ├── run_aaa_at_20160113185409.txt
# │   ├── run_bbb_at_20160113185409.txt
# │   ├── run_ccc_at_20160113185409.txt
# │   ├── run_ddd_at_20160113185409.txt
# │   ├── run_eee_at_20160113185409.txt
# │   ├── run_ffffff_at_20160113185409.txt
# │   ├── run_ggg_at_20160113185409.txt
# │   └── run_ssss_at_20160113185409.txt
# └── run
# 
#
# How to use it:
#  0. mv ./run to ./some_usefull_script_to_parse_logs (for example)
#  1. replace fork_body() function body with simple plain shell code 
#     NOTE: function recieve ONLY 1 parameter
#  2. test it like:
#     ./some_usefull_script_to_parse_logs server1 server2 server3
#
#     in dir out/ you should see results of work 
#
#  TODO: add exit code support


OUT=out
CONC=8; 
FORKKEY=FORKBEGIN
DEBUG=1
SHOW=1
echod()
{
	if [ "$DEBUG" == "1" ]; then 
		echo "$@" >&2
	fi
}
check()
{
	if [ ! -d "$OUT" ]; then
		mkdir -p $OUT
	fi
	MAX=$#
	echod "Setting new MAX=$MAX"
}
show()
{
	if [ "$SHOW" == 1 ]; then
		clear
		ls -lah $OUT
	fi
	#jobs -l
}
fork_body()
{
	#-----------------------------------------------------------------------------------
	# child body:
	#-----------------------------------------------------------------------------------
	echo "Script started with parameters: \"$@\" at $(date) with PID=$$"
	## ... doing something heavy ...
	## ...
	sleep $[ ( $RANDOM % 5 )  + 1 ]s
	echo "Complete at $(date)."
}
run_forks()
{
	JCOUNT="1"
	let CPID=0
	while [ "$JCOUNT" -ne "0" ]; do
		if [ "$JCOUNT" -lt "$CONC" ]; then
			let CPID=CPID+1
			if [ "$CPID" -le "$MAX" ]; then
				echod "JCOUNT=$JCOUNT < CONC=$CONC --> starting new task"
				# Setting parameters of running process:
				PARAMS="$1"
				shift
				# Running process
				DATE=$(date +"%Y%m%d%H%M%S")
				bash -c "$0 $FORKKEY $PARAMS" > $OUT"/"$0"_"$PARAMS"_at_"$DATE".txt" &
			fi
		fi
		JCOUNT=`jobs -l | grep -v Done| wc -l`
		show
		echod "JCOUNT=$JCOUNT"
		sleep .1
	done
	echo "All complete."
}
main()
{
	if [ "$1" == "$FORKKEY" ]; then
		shift
		fork_body "$@"
	else
		check "$@"
		run_forks "$@"
	fi
}
main "$@"
