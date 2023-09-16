#!/bin/bash

output="karabiner.edn"
input="main.edn"

cd $(dirname $0)

rm $output

getFileData() {
    local path=$1

    data=""

    while IFS= read line; do
        if [[ $line =~ \.edn\"$ ]]; then
            data="${data}$(getFileData $(echo $line | sed 's/"//g'))"
        else
            data="${data}$(echo $line | sed "s/;.*//")"
        fi
    done <$path

    data="${data}${line}"
    echo $data
}

data=$(getFileData $input)

# 转换后的 edn 文件中 显示一个 \ 需要转换为 \\ 在脚本中为 \\\\
echo $data | sed 's/\\/\\\\/g' >>$output
