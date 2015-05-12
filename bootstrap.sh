#!/usr/bin/env bash
#
# Stripped down version of Zach Holman's:
# https://github.com/holman/dotfiles/blob/master/script/bootstrap

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

link_file () {
    local src=$1 dst=$2
    local skip=
    local action=
    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then
        local currentSrc="$(readlink $dst)"
        if [ "$currentSrc" == "$src" ]
        then
            skip=true;
        else
            user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
            [s]kip, [o]verwrite, [b]ackup?"
            read -n 1 action
            case "$action" in
                s )
                    success "skipped $src";;
                o )
                    rm -rf "$dst"
                    success "removed $dst";;
                b )
                    mv "$dst" "${dst}.backup"
                    success "moved $dst to ${dst}.backup";;
                * )
                ;;
            esac
        fi
    fi
    if [ "$skip" != "true" ]
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

dotfilesroot=$(pwd)
for src in $(find -H "$dotfilesroot" -maxdepth 1 -name '*.symlink')
do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
done