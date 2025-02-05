#!/usr/bin/env bash

function convert() {
    echo "convert"
    mkdir -p "$2"
    mkdir -p "$2/cursors"
    touch "$2/index.theme"
    win2xcur "$1"/*ani -o "$2/cursors"
    win2xcur "$1"/*cur -o "$2/cursors"
}

function rename() {
    echo "rename"
    cd "$1/cursors" || exit 1
    mv Normal default
    mv Move dnd-move
    mv Text text
    mv Help help
    mv Busy wait
    mv Precision crosshair
    mv Handwriting pencil
    mv Link pointer
    mv Working progress
    mv Unavailable not-allowed
    mv Horizontal size_hor
    mv Vertical size_ver
    mv Diagonal1 size_fdiag
    mv Diagonal2 size_bdiag
    mv Alternate up-arrow
    cd ../..
}

function link() {
    echo "link"
    cd "$1/cursors" || exit 1
    for cursor in left_ptr; do
        ln -s default "$cursor"
    done

    for cursor in ibeam xterm; do
        ln -s text "$cursor"
    done

    for cursor in watch; do
        ln -s wait "$cursor"
    done

    for cursor in cross; do
        ln -s crosshair "$cursor"
    done

    for cursor in half-busy pointing_hand; do
        ln -s pointer "$cursor"
    done

    for cursor in left_ptr_watch; do
        ln -s progress "$cursor"
    done

    for cursor in circle crossed_circle; do
        ln -s not-allowed "$cursor"
    done

    for cursor in draft; do
        ln -s pencil "$cursor"
    done

    for cursor in split_v n-resize ns-resize row-resize s-resize v_double_arrow; do
        ln -s size_ver "$cursor"
    done

    for cursor in e-resize ew-resize h_double_arrow left_side right_side sb_h_double_arrow w-resize split_h col-resize; do
        ln -s size_hor "$cursor"
    done

    for cursor in bottom_right_corner top_left_cornersw-resize nw-resize nwse-resize se-resize; do
        ln -s size_fdiag "$cursor"
    done

    for cursor in bottom_left_corner top_right_cornerne-resize ne-resize nese-resize sw-resize; do
        ln -s size_bdiag "$cursor"
    done

    for cursor in closedhand dnd-none fleur grabbing move all-scroll size_all; do
        ln -s dnd-move "$cursor"
    done
    cd ../..
}

if [ $# -lt 2 ]; then
    echo "$0 <input_dir> <output_dir>"
    exit 1
fi

convert "$1" "$2"
rename "$2"
link "$2"
