#!/bin/sh
WHO=$1
FILE=~/parents_ts.csv
awk -F, -v who=$WHO '$1==who {print $2}' $FILE | xclip -selection clipboard
