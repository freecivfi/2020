#!/bin/bash
set -e
set -x

mkdir -p saves log

make -C ./build/

freeciv-server -d 4 -l log/civ.log -R log/rank.log -s saves -r build/fi2020.serv -p 32020
