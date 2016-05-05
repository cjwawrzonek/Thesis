#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined127/combined127.exp"
if [ -f $FPATH ]; then
	python experiment.py combined127 experiments/combined127
fi