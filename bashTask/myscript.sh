#!/usr/bin/env bash
array=($(grep  'grp-.*' file.json))
for i in "${array[@]}"
do
    echo $i | awk -F'"' '{print $2}'
done
