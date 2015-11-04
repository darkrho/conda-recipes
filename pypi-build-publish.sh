#!/bin/bash
set -eux

NAME=$1

if [ ! -d $NAME ]; then
  conda skeleton pypi $NAME
fi

conda build $NAME

conda server upload $(conda build --output $NAME)
