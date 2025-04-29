#!/bin/bash

temp="temp.edn"
output="karabiner.edn"
input="main.edn"

cd $(dirname $0)

rm $output

getFileData() {
    local path=$1

    while IFS= read line; do
        if [[ $line =~ \.edn\"$ ]]; then
            getFileData $(echo $line | sed 's/"//g')
        elif [[ $line =~ \.sh\"$ ]]; then
            IFS=" " read -r key path <<<"$line"
            echo "${key} \"" >>$temp
            cat $(echo $path | sed 's/"//g') | sed 's/# .*//' | sed 's/[\"]/\\&/g' | tr '\n' " " >>$temp
            echo '"' >>$temp
        else
            echo $line | sed 's/;.*//' | sed 's/\\/\\\\/g' >>$temp
        fi
    done <$path
}

getFileData $input

cat $temp | tr '\n' ' ' | tr -s ' ' >$output
rm $temp
