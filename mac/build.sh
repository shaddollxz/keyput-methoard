#!/bin/bash

temp="temp.edn"
output="karabiner.edn"
input="main.edn"
zip="keyput-methoard-mac.zip"

pwd=$(pwd)

cd "$pwd/scripts"
sh build.sh

cd "$pwd"

rm $zip
rm $output

getFileData() {
    local path=$1

    while IFS= read line; do
        if [[ $line =~ \.edn\"$ ]]; then
            getFileData $(echo $line | sed 's/"//g')
        else
            echo $line | sed 's/;.*//' | sed 's/\\/\\\\/g' >>$temp
        fi
    done <$path
}

getFileData $input

cat $temp | tr '\n' ' ' | tr -s ' ' >$output
rm $temp

7z a $zip $output install.sh keyput-methoard-scripts/*
