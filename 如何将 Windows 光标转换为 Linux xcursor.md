# 如何将 Windows 光标转换为 Linux xcursor
警告：`本文具有特定性，我未找到 x11 光标主题标准，可能会遇到一些问题`
## 目录
- [Windows 光标主题](#windows-光标主题结构)
- [安装 win2xcur](#安装-win2xcur)
- [xcursor 主题结构](#xcursor-主题结构)
- [Windows 光标主题与 xcursor 主题的不同点](#windows-光标主题与-xcursor-主题的不同点)
- [链接与重命名文件](#链接--重命名文件)
- [确保正确性](#确保正确性)
  - [KDE](#kde)
  - [可能适用于所有 Linux 发行版？](#可能适用于所有-linux-发行版)
- [关于 xcursor 的更多信息](#关于-xcursor-的更多信息)
  - [我的环境](#我的环境)

## Windows 光标主题结构
现在，我们有一个 Windows 光标主题。
Windows 光标主题的结构如下：
```bash
❯ ll
total 2.6M
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Alternate.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Busy.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Diagonal1.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Diagonal2.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Handwriting.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Help.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Horizontal.ani
-rw-r--r-- 1 lingu lingu 3.0K 10月 26 14:01  install.inf
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Link.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Move.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Normal.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Person.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Pin.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Precision.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Text.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Unavailable.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Vertical.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Working.ani
```

我们可以看到 Windows 光标文件类型是 `.ani`。
`install.inf` 是一个安装脚本，它在 Linux 上不起作用，只需关注 `.ani` 文件。
当然，`.cur` 也是 Windows 光标文件类型。
如何将 `.ani` 转换为 `.xcursor`？
我们可以使用 `win2xcur`。

## 安装 win2xcur
```bash
pip install win2xcur
win2xcur *.ani output_dir
```
输出目录如下：
```bash
ll
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./crosshair
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./default
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./dnd-move
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./help
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./not-allowed
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./pencil
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./pointer
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./progress
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_bdiag
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_fdiag
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_hor
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_ver
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./text
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./up-arrow
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./wait
```

更多关于 `win2xcur` 的信息在 [这里](https://github.com/quantum5/win2xcur "win2xcur")

## xcursor 主题结构
你可以在 Linux 机器上打开一个 xcursor 主题。
Linux 会将光标主题保存在 `~/.icons`（用户）和 `/usr/share/icons`（系统）等目录中。
跟我来：
```bash
cd ~/.icons
# 选择你喜欢的光标主题，然后输入 ll
# 在这里我使用 "Chroma-Black-M"
lingu@lingu-debian ~/.icons (master) 
❯ tree Chroma-Black-M/
Chroma-Black-M/
├── cursors
│   ├── bottom_left_corner -> size_bdiag
│   ├── bottom_right_corner -> size_fdiag
│   ├── circle -> not-allowed
│   ├── closedhand -> dnd-move
│   ├── cross -> crosshair
│   ├── crossed_circle -> not-allowed
│   ├── crosshair
│   ├── default
│   ├── dnd-move
│   ├── dnd-none -> dnd-move
│   ├── e-resize -> size_hor
│   ├── ew-resize -> size_hor
│   ├── fleur -> dnd-move
│   ├── grabbing -> dnd-move
│   ├── half-busy -> pointer
│   ├── h_double_arrow -> size_hor
│   ├── help
│   ├── ibeam -> text
│   ├── left_ptr -> default
│   ├── left_ptr_watch -> progress
│   ├── left_side -> size_hor
│   ├── move -> dnd-move
│   ├── ne-resize -> default
│   ├── nesw-resize -> default
│   ├── not-allowed
│   ├── n-resize -> size-ver
│   ├── ns-resize -> size-ver
│   ├── nw-resize -> default
│   ├── nwse-resize -> default
│   ├── pencil
│   ├── pointer
│   ├── progress
│   ├── right_side -> size_hor
│   ├── sb_h_double_arrow -> size_hor
│   ├── sb_v_double_arrow -> size-ver
│   ├── se-resize -> default
│   ├── size-bdiag -> default
│   ├── size_bdiag
│   ├── size-fdiag -> default
│   ├── size_fdiag
│   ├── size-hor -> default
│   ├── size_hor
│   ├── size-ver -> default
│   ├── size_ver
│   ├── s-resize -> size-ver
│   ├── sw-resize -> default
│   ├── text
│   ├── top_left_arrow -> default
│   ├── top_left_corner -> size_fdiag
│   ├── top_right_corner -> size_bdiag
│   ├── top_side -> size-ver
│   ├── up-arrow
│   ├── v_double_arrow -> size-ver
│   ├── wait
│   ├── watch -> wait
│   ├── w-resize -> size_hor
│   └── xterm -> text
└── index.theme

2 directories, 58 files
```

## Windows 光标主题与 xcursor 主题的不同点
如你所见，xcursor 主题比 Windows 光标主题有更多的文件。
而且 xcursor 主题有许多符号链接。
符号链接指向什么？让我们看看普通文件。
```bash
lingu@lingu-debian ~/.icons/Chroma-Black-M/cursors (master) 
❯ find -type f
./size_fdiag
./progress
./wait
./dnd-move
./up-arrow
./help
./pencil
./size_hor
./size_bdiag
./text
./not-allowed
./default
./pointer
./crosshair
./size_ver
lingu@lingu-debian ~/.icons/Chroma-Black-M/cursors (master) 
❯ find -type f | wc
     15      15     157
```
这些文件很重要。让我回顾一下 Windows 光标主题：
```bash
❯ ll
total 2.6M
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Alternate.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Busy.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Diagonal1.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Diagonal2.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Handwriting.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Help.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Horizontal.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Link.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Move.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Normal.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Person.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Pin.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Precision.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Text.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Unavailable.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Vertical.ani
-rw-r--r-- 1 lingu lingu  27K 10月 26 14:01  Working.ani

# 这里有 17 个 .ani 文件
```

你可能会问：`为什么文件数量不相等？`
是的，我不知道为什么。但 `Person.ani` 和 `Pin.ani` 可能是多余的。
回顾我们转换后的文件：
```bash
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./crosshair
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./default
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./dnd-move
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./help
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./not-allowed
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./pencil
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./pointer
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./progress
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_bdiag
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_fdiag
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_hor
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./size_ver
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./text
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./up-arrow
-rw-r--r-- 1 lingu lingu 49K  2月  3 00:58 ./wait

# 这里也有 15 个文件
```

如何将文件重命名为 xcursor 标准？
| 语言表达 | Windows 光标文件 |  xcursor 文件 |
|------|------|------|
|  正常  | Normal.ani  | default |
|  当你拖动窗口时  | Move.ani  | dnd-move  |
|  当光标在输入框上时  | Text.ani  | text  |
|  当光标在帮助上时  | Help.ani  | help  |
|  当光标在等待窗口上时  | Busy.ani  | wait  |
|    | Precision.ani | crosshair |
|    | Handwriting.ani | pencil  |
|   当光标在链接上时  | Link.ani  | pointer |
|   | Working.ani | progress  |
|   | Unavailable.ani | not-allowed |
|   | Alternate.ani | up-arrow  |
|   | Horizontal.ani  | size_hor  |
|   | Vertical.ani  | size_ver  |
|   | Diagonal1.ani | size_fdiag  |
|   | Diagonal2.ani | size_bdiag  |

## 链接与重命名文件
这是一个帮助你完成此操作的脚本：`https://github.com/Hello-lingu/win2xcur`
注意：`'-' 和 '_' 是不同的`
现在我们有了基本的光标，然后创建符号链接。
帮助：`ln -s 目标 链接名称` 可以创建一个指向 `目标` 的符号链接 `链接名称`
| 语言表达 | Windows 光标文件 |  xcursor 文件 | 符号链接 |
|------|------|------|------|
|   正常                      | Normal.ani  | default | left_ptr  |
|   当光标在输入框上时    | Text.ani  | text  | ibeam xterm |
|   当光标在帮助上时         | Help.ani  | help  |  |
|   当光标在等待窗口上时  | Busy.ani  | wait  | watch |
|                               | Precision.ani | crosshair | cross |
|                               | Handwriting.ani | pencil  |   draft   |
|   当光标在链接上时        | Link.ani  | pointer | half-busy pointing_hand |
|                               | Working.ani | progress  | left_ptr_watch |
|                               | Unavailable.ani | not-allowed | circle crossed_circle |
|                               | Alternate.ani | up-arrow  |     |
|                               | Horizontal.ani  | size_hor  | e-resize ew-resize h_double_arrow left_side right_side sb_h_double_arrow w-resize |
|                               | Vertical.ani  | size_ver  |    split_v n-resize ns-resize row-resize s-resize v_double_arrow   |
|   当光标在窗口右下角或左上角时  | Diagonal1.ani | size_fdiag  | bottom_right_corner top_left_cornersw-resize nw-resize nwse-resize se-resize |
|   当光标在窗口左下角或右上角时  | Diagonal2.ani | size_bdiag  | bottom_left_corner top_right_cornerne-resize ne-resize nese-resize sw-resize |
|   当你拖动窗口时        | Move.ani  | dnd-move  | closedhand dnd-none fleur grabbing move all-scroll size_all |

## 确保正确性
```txt
theme_name/
|-- cursors
|   |-- 你的光标文件
|-- index.theme
```
现在我们必须编写一个 `index.theme`。
index.theme
```txt
[Icon Theme]
Name=你的光标名称
Comment=你的光标描述
```

## 测试
现在，让我测试光标主题。
### KDE
  - 启动 `系统设置`
  - 进入 `外观`
  - 进入 `光标`
  - 将你的光标主题压缩为 `.tar.gz`
  - 点击 `从文件安装...`
  - 选择你的光标主题包（.tar.gz 或 .zip）

### 可能适用于所有 Linux 发行版？
  - 将你的光标主题复制或移动到 `~/.icons`
  - 确保你的主题结构正确
  - 然后你可以在设置中看到光标主题

如果一切正常，你可以愉快地使用你喜欢的光标。

## 关于 xcursor 的更多信息
### 我的环境
`Debian12` `Kde plasma` `conda python3.9` `x11`
[Cursor themes - ArchWiki](https://wiki.archlinux.org/title/Cursor_themes)
[Create your own mouse cursor theme | Developer](https://develop.kde.org/docs/features/cursor/)
[charakterziffer/cursor-toolbox: Tools to create an X11 cursor theme out of an SVG file](https://github.com/charakterziffer/cursor-toolbox)
