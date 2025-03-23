# How to convert Windows cursor to Linux xcursor
Warning: `This article has specificity, and I am not found x11 cursors theme standard, maybe you will find some issues`
## dirctory
- [Windows cursor theme](#windows-cursor-theme-structure)
- [install win2xcur](#install-win2xcur)
- [xcursor theme structure](#xcursor-theme-structure)
- [Windows cursor theme and xcursor theme different point](#windows-cursor-theme-and-xcursor-theme-different-point)
- [Link & rename files](#link--rename-files)
- [Make sure it's correct](#make-sure-its-correct)
  - [kde](#kde)
  - [maybe all Linux released?](#maybe-all-Linux-released?)
- [More information about xcursor](#more-information-about-xcursor)
  - [my environment](#my-environment)

## Windows cursor theme structure
Now, we get a Windows cursor theme.
The Windows cursor theme structure like:
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

We can see Windows cursor filetype is `.ani`.
The `install.inf` is a install script, It donesn't work on linux, only careful the `.ani` files
Ofcause, the `.cur` also Windows cursor filetype.
How to convert `.ani` to `.xcursor`
We can use the `win2xcur`.

## install win2xcur
```bash
pip install win2xcur
win2xcur *.ani output_dir
```
The output_dir like
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

More information about `win2xcur` in [here](https://github.com/quantum5/win2xcur "win2xcur")

## xcursor theme structure
You can open a xcursor theme on you Linux machine.
Linux will save the cursor theme in `~/.icons`(user) and `/usr/share/incons`(system) and so on.
Follow me:
```bash
cd ~/.icons
# choose you favorite cursor theme than input ll
# In here I use "Chroma-Black-M"
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

## Windows cursor theme and xcursor theme different point
As you can see. The xcursor themes have more files then The Windows cursor themes.
And xcursor theme have many symbol link.
What the symbol linked, let's see the normal files.
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
These files are important. Let me replay the Windows cursor theme
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

# there are 17 .ani files
```

Maybe you will ask: `Why the files number is not equle?`
Yes, I don't konw why. But `Person.ani` and `Pin.ani` maybe fifth wheel.
Replay our converted.
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

# there are also 15 files
```

How to rename files to be xcursor standard?
| language expression | Window cursor file |  xcursor file |
|------|------|------|
|  Normal  | Normal.ani  | default |
|  When you drag window  | Move.ani  | dnd-move  |
|  When cursor on input-box  | Text.ani  | text  |
|  When cursor on help  | Help.ani  | help  |
|  When cursor on wait window  | Busy.ani  | wait  |
|    | Precision.ani | crosshair |
|    | Handwriting.ani | pencil  |
|   When cursor on links  | Link.ani  | pointer |
|   | Working.ani | progress  |
|   | Unavailable.ani | not-allowed |
|   | Alternate.ani | up-arrow  |
|   | Horizontal.ani  | size_hor  |
|   | Vertical.ani  | size_ver  |
|   | Diagonal1.ani | size_fdiag  |
|   | Diagonal2.ani | size_bdiag  |

## Link & rename files
This is a script to help you do that: `https://github.com/Hello-lingu/win2xcur`
NOTE: `'-' and '_' is different`
Now we have basic cursors, then make the symbol links.
Help:`ln -s TARGET LINK_NAME` can create a symbol link `LINK_NAME` point `TAEGET`
| language expression | Window cursor file |  xcursor file | symbol links |
|------|------|------|------|
|   Normal                      | Normal.ani  | default | left_ptr  |
|   When cursor on input-box    | Text.ani  | text  | ibeam xterm |
|   When cursor on help         | Help.ani  | help  |  |
|   When cursor on wait window  | Busy.ani  | wait  | watch |
|                               | Precision.ani | crosshair | cross |
|                               | Handwriting.ani | pencil  |   draft   |
|   When cursor on links        | Link.ani  | pointer | half-busy pointing_hand |
|                               | Working.ani | progress  | left_ptr_watch |
|                               | Unavailable.ani | not-allowed | circle crossed_circle |
|                               | Alternate.ani | up-arrow  |     |
|                               | Horizontal.ani  | size_hor  | e-resize ew-resize h_double_arrow left_side right_side sb_h_double_arrow w-resize |
|                               | Vertical.ani  | size_ver  |    split_v n-resize ns-resize row-resize s-resize v_double_arrow   |
|   When cursor on window bottom-right or top-left  | Diagonal1.ani | size_fdiag  | bottom_right_corner top_left_cornersw-resize nw-resize nwse-resize se-resize |
|   When cursor on window bottom-left or top-right  | Diagonal2.ani | size_bdiag  | bottom_left_corner top_right_cornerne-resize ne-resize nese-resize sw-resize |
|   When you drag window        | Move.ani  | dnd-move  | closedhand dnd-none fleur grabbing move all-scroll size_all |

## Make sure it's correct
```txt
theme_name/
|-- cursors
|   |-- your cursor files
|-- index.theme
```
Now we must write a `index.theme`.
index.theme
```txt
[Icon Theme]
Name=your cursor name
Comment=your cursor descriptor
```

## Test
Now, let me test the cursor theme.
### kde
  - start `system setting`
  - into `Appearance`
  - into `cursor`
  - compress your cursor theme to be `.tar.gz`
  - click `install from file...`
  - select your cursor theme package(.tar.gz or .zip)

### maybe all Linux released?
  - copy or move your cursor theme to `~/.icons`
  - pleaseure your theme structure is right
  - then your can see cursor theme on your settings

If everything is fine, you can pleasantly use your favorite cursor.

## More information about xcursor
### my environment
`Debian12` `Kde plasma` `conda python3.9` `x11`
[Cursor themes - ArchWiki](https://wiki.archlinux.org/title/Cursor_themes)
[Create your own mouse cursor theme | Developer](https://develop.kde.org/docs/features/cursor/)
[charakterziffer/cursor-toolbox: Tools to create an X11 cursor theme out of an SVG file](https://github.com/charakterziffer/cursor-toolbox)

