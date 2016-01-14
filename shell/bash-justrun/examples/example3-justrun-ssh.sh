#!/bin/bash
source $PATH_TO_LIB/justrun-lib
SSH_OPTIONS="-oLogLevel=error"
SSH_OPTIONS="${SSH_OPTIONS} -oBatchMode=yes"
SSH_OPTIONS="${SSH_OPTIONS} -oStrictHostKeyChecking=no"
SSH_OPTIONS="${SSH_OPTIONS} -oUserKnownHostsFile=/dev/null"
SSH_OPTIONS="${SSH_OPTIONS} -i ~/.ssh/keystorage/key"
SSH_BIN=/usr/bin/ssh
SSH_USER=username
SSH_PORT=22
CONC=32
fork_body()
{
	if [ ! -z "$1" ]; then
		COMMAND_CHECK="getent passwd username"
		# check if user "username" exist on server
		COMMAND="[ ! -z \\\$($COMMAND_CHECK) ] && echo EXIST || echo NOT"
		SERVER_CURRENT=$1
		PORTCHECK=$(nmap $SERVER_CURRENT -p $SSH_PORT | grep open)
		if [ ! -z "$PORTCHECK" ]; then
			R="$SSH_BIN ${SSH_OPTIONS} $SSH_USER@$SERVER_CURRENT \"$COMMAND\""
			bash -c "$R"
		else
			echo "Port $SSH_PORT is closed."
		fi
	fi
}
main "$@"
