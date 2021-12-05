#!/bin/zsh
VENV=$1
TARGET=${2:-cpu}
source ~/.local/bin/virtualenvwrapper.sh
workon $VENV;

if [ "$TARGET" = "cpu" ]; then
    jupyter lab
elif [ "$TARGET" = "gpu" ]; then
    optirun jupyter lab
fi
