#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined161/combined161.exp"
if [ -f $FPATH ]; then
	python experiment.py combined161 experiments/combined161
fi