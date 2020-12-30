#!/bin/sh
# script to show the newly installed packages
DB=$HOME/pkgs/.packages
# allows comments following #
comm -3 <(pacman -Qqe) \
    <(clean_packages.awk ${DB} | sort)
