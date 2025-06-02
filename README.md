# keyput-methoard

自定义键盘映射，灵感来源于 [myKeyMap](https://github.com/xianyukang/MyKeymap)，根据自己的需求重写的一套配置

## windows

> [!IMPORTANT]
> 注意：windows 下使用了 [AutoHotKey](https://www.autohotkey.com) 实现键位映射，某些游戏可能会把本软件视为外挂脚本，注意在该情况下将本软件关闭再进行游戏

### 下载及使用

在 [release](https://github.com/shaddollxz/keyput-methoard/releases/latest) 中下载 **Keyput-Methoard.exe** 直接运行即可

### 开机自启动

把 exe 文件放到 `C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` 下

### 修改配置并编译

如果需要修改键位，可以 fork 下本仓库，自己进行修改 modules 下的映射并通过 `win/build/build.ps1` 编译，[AHK 官网](https://www.autohotkey.com) 中可以找到脚本语法说明和调试方法

## mac

mac 上使用 [karabiner](https://karabiner-elements.pqrs.org/) 来映射按键，这里使用了 [goku](https://github.com/yqrashawn/GokuRakuJoudo/tree/master) 生成配置

### 下载及使用

1. 下载 [karabiner](https://karabiner-elements.pqrs.org/) 和 [goku](https://github.com/yqrashawn/GokuRakuJoudo/tree/master)

2. 在 [release](https://github.com/shaddollxz/keyput-methoard/releases/latest) 中下载 **keyput-methoard-mac.zip**

3. 解压下载的 zip 并执行其中的 install.sh
    - 会在 ~/.config 目录中新增 `karabiner.edn` 和 `keyput-methoard-scripts`

### 修改配置并编译

同样的，如果需要修改键位，可以看看[goku 的配置文档](https://github.com/yqrashawn/GokuRakuJoudo/blob/master/tutorial.md)自己修改 modules 下的配置并通过 `mac/build.sh` 生成压缩包

## 键位替换说明

新增的键位主要分为 `9模式` `3模式` `分号模式` `caps模式` `tab模式`

同时为了在 `windows` 和 `mac` 下手感相同，这里额外做了一些键位修改

### windows

- 把 `右 alt` 和 `右 ctrl` 进行了替换，和 `mac` 的键位保持一致
- `左ctrl + q` 会关闭当前窗口
- `左ctrl + h` 会隐藏当前窗口
- `win + space` 会触发 windows 的焦距搜索
- `win + 左键` 会触发右键

### mac

这里只提供了复杂键映射，需要在 `karabiner` 中额外配置 `command` 等键的映射，这里给出推荐配置

| from         | to           |
| ------------ | ------------ |
| key_code::fn | left_command |
| left_command | left_option  |
| left_option  | key_code::fn |

### 9 模式

在按住 `9` 时同时对其他键操作会进入对应的副模式

- 按下 `space`：移动键会自动带上 `shift` 进行多选，再次按下该键或按下删除键、功能键退出
- 按下 `i`：删除键会自动带上 `ctrl` 能以单词为单位进行删除，再次按下该键退出
- 按住 `caps`：上下移动键 `w s` 会同时带上 `alt` 能将多行文本上下移动，可以和 `space` 副模式同时使用；在使用代码折叠功能（9 + h）时，带上该键为展开代码

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
