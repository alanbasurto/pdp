#!/usr/bin/env bash
disk="/dev/sda2"
array=($(df -H | grep  ${disk} | awk '{ print $5 " " $1 }'))
number=${array[0]:0:$((${#array[0]}-1))} 
limit=2


if [ $((number)) -gt 2 ]
    then
    VAR="Subject:Usage Alert
Filesystem / has breached ${limit}% threshold utilization, and admin attention is needed

$( df -H | head -n 1)
$(df -H | grep  ${disk})

Scan date is $(date -u)"
    echo -e "${VAR}" | ssmtp alanrodrigo@google.com
    # cat $body | mailx -s "$subject" "$recipient"
fi
