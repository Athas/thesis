#!/bin/sh

set -e

for x in $*; do
    echo "$x"
    for i in $(seq 1000); do
        /usr/bin/time -f %E "$x" 2>&1 1>/dev/null | cut -d ':' -f 2
    done | \
        awk '{ sum+=$1; count++; } END { print sum/count }'
done
