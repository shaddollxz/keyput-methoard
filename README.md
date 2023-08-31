# keyput-methoard -- 我的自定义键入法

通过 [AHK](https://www.autohotkey.com) 实现的自定义键盘，灵感来源于[myKeyMap](https://github.com/xianyukang/MyKeymap)，根据自己的需求重写的一套脚本，当前支持移动光标，快速输入符号

## 使用

在 release 中选择对应版本的 exe 文件下载

或者克隆代码，在本地使用 `powershell` 在 `build` 目录中运行脚本 `build.ps1` 进行编译

## 说明

当前支持 5 种输入模式，分别为

- `9模式` 快速移动光标，删除文本
- `3模式` 快速输入数字，删除文本
- `分号模式` 快速输入符号，同时有伴生的`引号模式`,用来补全`分号模式`中括号输入的不足
- `win模式` 把`window + 数字`键和`fn`映射（键盘上的 `fn` 没法捕获到）
- `tab模式` 不进行输入，主要对窗口和 tab 进行操作

具体规则通过代码查看： [9 模式](/src/modules/mode-9.ahk)，[3 模式](/src/modules/mode-3.ahk)，[分号模式](/src/modules/mode-semi.ahk)，[引号模式](/src/modules/mode-quote.ahk)，[win 模式](/src/modules/mode-win.ahk)，[tab 模式](/src/modules/mode-tab.ahk)

同时还有一个将`window`键位和快捷键向`mac`兼容的模式：[mac 模式](/src/modules/mode-mac.ahk)

## 在 mac 上使用

`autohotkey` 只支持在`windows`系统上使用，如果需要在`mac`中设置键位，推荐使用[karabiner](https://karabiner-elements.pqrs.org/)，同时配合[goku](https://github.com/yqrashawn/GokuRakuJoudo/tree/master)来生成配置文件，[这里](/mac)提供了同该项目的键位配置
