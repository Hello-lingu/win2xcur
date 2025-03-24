#!/usr/bin/env bash

symbolic_to_default="left_ptr"
symbolic_to_text="ibeam xterm"
symbolic_to_wait="watch"
symbolic_to_crosshair="cross"
symbolic_to_pointer="hand1 hand2 half-busy pointing_hand"
symbolic_to_progress="left_ptr_watch"
symbolic_to_not_allowed="circle crossed_circle"
symbolic_to_pencil="draft"
symbolic_to_size_ver="split_v n-resize ns-resize row-resize s-resize v_double_arrow"
symbolic_to_size_hor="e-resize ew-resize h_double_arrow left_side right_side sb_h_double_arrow w-resize split_h col-resize"
symbolic_to_size_fdiag="bottom_right_corner top_left_cornersw-resize nw-resize nwse-resize se-resize"
symbolic_to_size_bdiag="bottom_left_corner top_right_cornerne-resize ne-resize nese-resize sw-resize"
symbolic_to_dnd_move="closedhand dnd-none fleur grabbing move all-scroll size_all"

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
    local links=($2)

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

    cd ../..
}

if [ $# -lt 2 ]; then
    echo "$0 <input_dir> <output_dir>"
    exit 1
fi

convert "$1" "$2"
rename_cursors "$2"
link_cursors "$2"
