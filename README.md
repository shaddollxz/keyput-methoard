# keyput-methoard

自定义键盘映射，灵感来源于[myKeyMap](https://github.com/xianyukang/MyKeymap)，根据自己的需求重写的一套配置

## win

### 使用

在 [release](https://github.com/shaddollxz/keyput-methoard/blob/main/releases) 中选择 exe 文件下载

或者拉下代码，在本地使用 `powershell` 运行 `win/build/build.ps1` 脚本进行编译

如果需要修改键位，可以 fork 下本仓库，自己进行修改，[AHK 官网](https://www.autohotkey.com) 中可以找到脚本语法说明

### 开机自启动

把 exe 文件放到 `C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` 下即可

## mac

mac 上推荐使用 [karabiner](https://karabiner-elements.pqrs.org/) 来设置按键，这里提供了 [goku](https://github.com/yqrashawn/GokuRakuJoudo/tree/master) 的配置

> goku 可以用更简洁的语法生成 karabiner 的配置文件

### 使用

- 下载 [karabiner](https://karabiner-elements.pqrs.org/) 和 [goku](https://github.com/yqrashawn/GokuRakuJoudo/tree/master)

- 在 [release](https://github.com/shaddollxz/keyput-methoard/blob/main/releases) 中下载 karabiner.edn

- 或者拉下代码，在本地使用 `bash` 运行 mac 文件夹下的 `build.sh` 脚本来生成 `karabiner.edn`

- 把 `karabiner.edn` 复制到 `~/.config` 下

- 命令行执行命令 `goku`

同样的，如果需要修改键位，可以看看[goku 的配置文档](https://github.com/yqrashawn/GokuRakuJoudo/blob/master/tutorial.md)自己修改

## 键位替换说明

为了在 `win` 和 `mac` 下手感相同，这里额外做了一些键位修改

### win

- 把 `右alt` 和 `右ctrl` 进行了替换，和 `mac` 的键位保持一致
- `左ctrl + q` 会关闭当前窗口
- `左ctrl + h` 会隐藏当前窗口

### mac

这里只提供了复杂键映射，需要在 `karabiner` 中额外配置 `command`等键的映射，这里给出推荐配置

| from         | to           |
| ------------ | ------------ |
| key_code::fn | left_command |
| left_command | left_option  |
| left_option  | key_code::fn |

## 键位说明

主要分为 `9模式` `3模式` `分号模式` `caps模式` `tab模式`

### 9 模式

在按住 `9` 时同时对其他键操作会进入对应的副模式

- 按下 `space`：移动键会自动带上 `shift` 进行多选，再次按下该键或按下删除键、功能键退出
- 按下 `i`：删除键会自动带上 `ctrl` 能以单词为单位进行删除，再次按下该键退出
- 按住 `caps`：上下移动键`w s`会同时带上 `alt` 能将多行文本上下移动，可以和 `space` 副模式同时使用；在使用代码折叠功能（9 + h）时，带上该键为展开代码

![mode_9](/keyboard-map/mode_9.png)

### 3 模式

输入数字，为了保证容错，有几个数字进行了多次设置

![mode_3](/keyboard-map/mode_3.png)

### 分号模式

输入字符，同时为了弥补分号输入没有右括号的问题，额外添加了 `引号模式` 进行补足

![mode_semi](/keyboard-map/mode_semi.png)

### Caps 模式

主要拿来做页面切换，浏览器快捷键等和输入没关系的事

![mode_caps](/keyboard-map/mode_caps.png)

### Tab 模式

`ctrl + alt` / `command + options` 作为组合键实在不好用，这里为这个组合提供了快捷键
