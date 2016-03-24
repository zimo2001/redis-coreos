#!/bin/bash

NAME=redis-server
USER=redis
GROUP=redis
DAEMON=/usr/bin/redis-server
DAEMON_ARGS=/etc/redis/redis.conf


# source /etc/default/redis-server
if [ -r /etc/default/$NAME ]
then
	. /etc/default/$NAME
fi


# if $ULIMIT is defined in /etc/default/redis-server, apply it
if [ -n "$ULIMIT" ]
	then
		ulimit -n $ULIMIT
	fi

# run it!
/sbin/runuser --user ${USER} --group ${GROUP} -s /bin/bash -c "${DAEMON} ${DAEMON_ARGS}"
