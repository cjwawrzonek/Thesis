#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection127/selection127.exp"
if [ -f $FPATH ]; then
	python experiment.py selection127 experiments/selection127
fi