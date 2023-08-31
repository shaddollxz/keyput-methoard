#!/bin/bash

output="karabiner.edn"
input="main.edn"

cd $(dirname $0)

rm $output

writeFile() {
    local path=$1

    while IFS= read line; do
        if [[ $line =~ \.edn\"$ ]]; then
            $(writeFile $(echo $line | sed 's/"//g'))
        else
            # 转换后的 edn 文件中 显示一个 \ 需要转换为 \\ 在脚本中为 \\\\
            echo $(echo $line | sed 's/\\/\\\\\\\\/g') >>$output
        fi
    done <$path

    echo $line >>$output
}

writeFile $input
