#!/bin/bash
### BEGIN INIT INFO
# Provides:          APPLICATION
# Required-Start:    $all
# Required-Stop:     $network $local_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start the APPLICATION unicorns at boot
# Description:       Enable APPLICATION at boot time.
### END INIT INFO
#

set -u
set -e

APP_ROOT=/home/tasks/app/tasks/production/
PID=$APP_ROOT/shared/tmp/pids/unicorn.pid
ENV=production
USER="deploy"

# visudo:
# clinical ALL=NOPASSWD: /etc/init.d/unicorn-sats
#https://gist.github.com/killercup/2049606
#rvm wrapper ruby-2.0.0-p347@sats sats unicorn #=> /home/clinical/.rvm/bin/sats_unicorn
RVM_BOOTUP_SCRIPT="/home/$USER/.rvm/bin/sats_unicorn" #/home/$USER/.rvm/bin/bootup_unicorn_sats"
CMD="cd $APP_ROOT/current && $RVM_BOOTUP_SCRIPT -D -E $ENV -c config/unicorn/$ENV.rb"
old_pid="$PID.oldbin"

#cd $APP_ROOT || exit 1

sig () {
    test -s "$PID" && kill -$1 `cat $PID`
}

oldsig () {
    test -s $old_pid && kill -$1 `cat $old_pid`
}

case $1 in
start)
    sig 0 && echo >&2 "Already running" && exit 0
		su - $USER -c "$CMD"
    ;;
stop)
    sig QUIT && exit 0
    echo >&2 "Not running"
    ;;
force-stop)
    sig TERM && exit 0
    echo >&2 "Not running"
    ;;
restart|reload)
    sig HUP && echo reloaded OK && exit 0
    echo >&2 "Couldn't reload, starting 'su - $USER -c "$CMD"' instead"
    su - $USER -c "$CMD"
    ;;
upgrade)
    sig USR2 && exit 0
    echo >&2 "Couldn't upgrade, starting 'su - $USER -c "$CMD"' instead"
    su - $USER -c "$CMD"
    ;;
rotate)
  sig USR1 && echo rotated logs OK && exit 0
  echo >&2 "Couldn't rotate logs" && exit 1
  ;;
*)
    exit 1
    ;;
esac

exit 0
