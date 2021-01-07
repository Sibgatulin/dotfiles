#!/usr/bin/awk -f
BEGIN{FS="#"}
/^#/ {next} # skip line comments
/^(\s)*$/ {next} # skip empty lines
{# and drop in-line comments
    gsub(/ $/,"",$1) # remove trailing spaces
    print $1
}
