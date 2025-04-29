#!/bin/bash

temp="temp.edn"
output="karabiner.edn"
input="main.edn"
zip="keyput-methoard.zip"

cd $(dirname $0)

rm $zip
rm $output

getFileData() {
    local path=$1

    while IFS= read line; do
        if [[ $line =~ \.edn\"$ ]]; then
            getFileData $(echo $line | sed 's/"//g')
        elif [[ $line =~ \.sh\"$ ]]; then
            IFS=" " read -r key path <<<"$line"
            echo "${key} \"sh ~/.config/$(echo $path | sed 's/"//g')\"" >>$temp
        else
            echo $line | sed 's/;.*//' | sed 's/\\/\\\\/g' >>$temp
        fi
    done <$path
}

getFileData $input

cat $temp | tr '\n' ' ' | tr -s ' ' >$output
rm $temp

7z a $zip $output com.github.shaddollxz.keyput-methoard.screen-info-cache-updater.plist keyput-methoard-scripts/*.sh
