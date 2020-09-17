#!/bin/sh

# Copyright (c) 2006-2017 Intel Corporation. All rights reserved.
# This script installs Intel(R) Software Development Products.

cd_eject=true
[ "$cd_eject" = "false" ] && exit

if [ -z "$UID" ]; then
    UID=$(id -ru);
fi;
if [ "$UID" -ne 0 ]; then
    exit
fi

SCRIPT_DIR=$(dirname "$0")
SCRIPT_DIR=$(cd "$SCRIPT_DIR"; pwd)
SCRIPT_DIR_DF=$(df "$SCRIPT_DIR")
SCRIPT_STARTS_DEVICE=`df -P "${SCRIPT_DIR}" | tail -n1 | awk '{print $1}'`

DEVICE_FILESYSTEM=`df -T "$SCRIPT_DIR" | grep /dev | awk '{print $2}'`

# return 0 or 1. 0 == no, 1 == yes
ASK_YES_NO_QUESTION()
{
    local QUESTION="$1"
    local DEFAULT_ANSWER="$2"
    local ANSWER=""

    echo -n "$QUESTION ( Yes/No ) [ ${DEFAULT_ANSWER} ]: "

    while [ "$ANSWER" = "" ] ; do
        read ANSWER
        ANSWER=`echo $ANSWER | tr [A-Z] [a-z]`
        case "$ANSWER" in
            y|yes|yea|yeah|yep)
            return 1
            ;;

            n|no|not|nop|nope)
            return 0
            ;;

            *)
            if [ -z "$ANSWER" ] ; then
                DEFAULT_ANSWER=$(echo $DEFAULT_ANSWER | tr [A-Z] [a-z])
                [ "$DEFAULT_ANSWER" = "yes" ] && return 1
                return 0
            else
                echo "ERROR: Invalid value, please try again."
                echo
                ASK_YES_NO_QUESTION  "$QUESTION" "$DEFAULT_ANSWER"
            fi
        esac
    done
}

if [ "$DEVICE_FILESYSTEM" = "iso9660" ] || [ "$DEVICE_FILESYSTEM" = "udf" ] ; then
    ASK_YES_NO_QUESTION "Would you like to close the console and eject the CD?" "Yes"
    [ $? -eq 0 ] && exit # exit if "no"
else
    exit
fi

PARENT_PID=$1
CHILD_SCRIPT=`mktemp -q /tmp/cd_eject.sh.XXXXXXX` || exit

echo "Please wait ..."
cat > $CHILD_SCRIPT <<END
#!/bin/sh

EJECT_AND_EXIT()
{
    eject $SCRIPT_STARTS_DEVICE >/dev/null 2>&1
    exit
}

sleep 3
# the first try
umount -l $SCRIPT_STARTS_DEVICE >/dev/null 2>&1

# eject the cd and exit if unmount was successfull
[ "\$?" = "0" ] && EJECT_AND_EXIT

BG_JOBS=\`ps -o ppid ax | awk '{ if ( \$1 == "$PARENT_PID" ) { print \$1 } }' | wc -l \`

if [ "\$BG_JOBS" != 0 ] ; then
    echo
    echo "Unable to close the console and unmount the CD. The following jobs are running in background:"
    echo "PPID  PID  CMD"
    ps -o ppid,pid,cmd ax | awk '{ if ( \$1 == "$PARENT_PID" ) { print \$1,\$2,\$3 } }' 
    echo "Press <Enter> ..."
else
    # close parent shell
    kill -9 $PARENT_PID > /dev/null 2>&1
    sleep 5
    umount -l $SCRIPT_STARTS_DEVICE > /dev/null 2>&1
    [ "\$?" = "0" ] && EJECT_AND_EXIT

    if which lsof > /dev/null 2>&1; then  
        echo
        echo "Unable to unmount the CD. The following processes are still using a resource on the mounted device:"

        lsof $SCRIPT_STARTS_DEVICE
        echo "Press <Enter> ..."
    else 	
        if [ -f /usr/sbin/lsof ]; then
            echo
            echo "Unable to unmount the CD. The following processes are still using a resource on the mounted device:"
            /usr/sbin/lsof $SCRIPT_STARTS_DEVICE
            echo "Press <Enter> ..."
        else
            echo
            echo "Unable to unmount the CD."
            echo "Press <Enter> ..."
        fi
    fi
fi

END

chmod +x $CHILD_SCRIPT

cd /tmp
$CHILD_SCRIPT &
