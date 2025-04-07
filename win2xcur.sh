#!/usr/bin/env bash

symbolic_to_default="left_ptr openhand"
symbolic_to_text="ibeam xterm"
symbolic_to_wait="watch"
symbolic_to_crosshair="cross"
symbolic_to_pointer="hand1 hand2 half-busy pointing_hand e29285e634086352946a0e7090d73106 9d800788f1b08800ae810202380a0822"
symbolic_to_progress="left_ptr_watch 08e8e1c95fe2fc01f976f1e063a24ccd 3ecb610c1bf2410f44200f48c40d3599"
symbolic_to_not_allowed="circle crossed_circle 03b6e0fcb3499374a867c041f52298f0"
symbolic_to_pencil="draft"
symbolic_to_size_ver="split_v n-resize ns-resize row-resize s-resize sb_v_double_arrow 00008160000006810000408080010102 down-arrow bottom_side top_side"
symbolic_to_size_hor="e-resize ew-resize h_double_arrow left_side right_side sb_h_double_arrow w-resize split_h col-resize left-arrow right-arrow"
symbolic_to_size_fdiag="bottom_right_corne ul_angle lr_angle top_left_corner top_left_cornersw-resize nw-resize nwse-resize se-resize"
symbolic_to_size_bdiag="bottom_left_corner ur_angle ll_angle top_right_corner top_right_cornerne-resize ne-resize nese-resize sw-resize"
symbolic_to_dnd_move="closedhand dnd-none fleur grabbing move all-scroll size_all 4498f0e0c1937ffe01fd06f973665830 9081237383d90e509aa00f00170e968f grab"
symbolic_to_help="5c6cd98b3f3ebcb1f9c7f1c204630408 whats_this question_arrow left_ptr_help"
symbolic_to_up_arrow="link"

# 这些指针似乎没有对应的 Windows 指针？
# copy -> symbolic_to_copy="dnd-copy b66166c04f8c3109214a4fbd64a50fc8 6407b0e94181790501fd1e167b474872 1081e37283d90000800003c07f3ef6bf"
# alias -> symbolic_to_alias="a2a266d0498c3104214a47bd64ab0fc8 3085a0e285430894940527032f8b26df 640fb0e74195791501fd1ed57b41487f"

function convert() {
    echo "convert"
    mkdir -p "$2"
    mkdir -p "$2/cursors"
    touch "$2/index.theme"
    win2xcur "$1"/*ani -o "$2/cursors"
    win2xcur "$1"/*cur -o "$2/cursors"
}

function rename() {
    if [ -e "$1" ]; then
        mv "$1" "$2"
    else
        echo "Warning: Cound not exist \"$1\""
    fi
}

function link() {
    local target=$1
    local links=("$2")

    if [ -e "$target" ]; then
        for cursor in "${links[@]}"; do
            ln -s "$target" "$cursor"
        done
    else
        echo "Warning: Target not exist '$target'"
    fi
}

function rename_cursors() {
    echo "rename"
    cd "$1/cursors" || exit 1
    rename Normal default
    rename Move dnd-move
    rename Text text
    rename Help help
    rename Busy wait
    rename Precision crosshair
    rename Handwriting pencil
    rename Link pointer
    rename Working progress
    rename Unavailable not-allowed
    rename Horizontal size_hor
    rename Vertical size_ver
    rename Diagonal1 size_fdiag
    rename Diagonal2 size_bdiag
    rename Alternate up-arrow
    cd ../..
}


function link_cursors() {
    echo "link"
    cd "$1/cursors" || exit 1

    link "default"         "$symbolic_to_default"
    link "text"            "$symbolic_to_text"
    link "wait"            "$symbolic_to_wait"
    link "crosshair"       "$symbolic_to_crosshair"
    link "pointer"         "$symbolic_to_pointer"
    link "progress"        "$symbolic_to_progress"
    link "not-allowed"     "$symbolic_to_not_allowed"
    link "pencil"          "$symbolic_to_pencil"
    link "size_ver"        "$symbolic_to_size_ver"
    link "size_hor"        "$symbolic_to_size_hor"
    link "size_fdiag"      "$symbolic_to_size_fdiag"
    link "size_bdiag"      "$symbolic_to_size_bdiag"
    link "dnd-move"        "$symbolic_to_dnd_move"
    link "help"            "$symbolic_to_help"
    link "up-arrow"        "$symbolic_to_up_arrow"

    cd ../..
}

if [ $# -lt 2 ]; then
    echo "$0 <input_dir> <output_dir>"
    exit 1
fi

convert "$1" "$2"
rename_cursors "$2"
link_cursors "$2"
