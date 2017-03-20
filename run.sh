#!/bin/sh
set -e

cd $1
make
python ./plotfile.py
cd ..