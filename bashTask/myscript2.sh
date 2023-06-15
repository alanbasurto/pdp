#!/usr/bin/env bash
array=($(df -H | grep  '/dev/disk3s3s1' | awk '{ print $5 " " $1 }'))
number=${array[0]:0:1} 
limit=2
disk="/dev/disk3s3s1"

if [ $((number)) -gt 2 ]
    then
    VAR="
Filesystem / has breached ${limit}% threshold utilization, and admin attention is needed

$( df -H | head -n 1)
$(df -H | grep  ${disk})

Scan date is $(date -u)"
    echo -e "${VAR}"
    # # Send the email.
    # cat $body | mailx -s "$subject" "$recipient"
fi




#   GNU nano 6.2     en terminal del server                                                                                          myscript2.sh                                                                                                         
# #!/usr/bin/env bash
# disk="/dev/root"
# array=($(df -H | grep ${disk} | awk '{ print $5 " " $1 }'))
# number=${array[0]:0:1} 
# limit=2
# subject="testing"
# recipient="alanrbasurto@gmail.com"
# if [ $((number)) -gt 2 ]
#     then
#     body="
# Filesystem / has breached ${limit}% threshold utilization, and admin attention is needed

# $( df -H | head -n 1)
# $(df -H | grep  ${disk})

# Scan date is $(date -u)"
#     echo -e "${body}"
#     # # Send the email.
#      cat $body | mailx -s "$subject" "$recipient"
# fi