#!/bin/sh

set -e # Die on error.

for svg in *svg; do
  inkscape -D -A=$(echo "$svg" | sed 's/svg$/pdf/') "$svg"
done
