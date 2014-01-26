#!/bin/sh

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <files>"
    exit 1
fi

for x in "$@"; do
    cfile=$(basename "$x"|sed 's/l0$/c/')
    binfile=$(basename "$x"|sed 's/l0$/bin/')

    echo "Compiling $x"
    l0c -u --compile-sequential "$x" > "$cfile"

    gcc "$cfile" -o "$binfile" -lm -O3

    rm "$cfile"

    echo "Wrote $binfile."
done
