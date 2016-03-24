#!/bin/bash

NAME=redis-server
USER=redis
GROUP=redis
DAEMON=/usr/bin/redis-server
DAEMON_ARGS=/etc/redis/redis.conf


RUNDIR=/var/run/redis
PIDFILE=$RUNDIR/redis-server.pid


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

start-stop-daemon --start --quiet --umask 007 --pidfile $PIDFILE --chuid $USER:$GROUP --exec $DAEMON -- $DAEMON_ARGS
