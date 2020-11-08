#!/bin/bash
set -e
set -x

mkdir -p saves log

freeciv-server -d 4 -l log/civ.log -R log/rank.log -s saves -r game -p 32020
