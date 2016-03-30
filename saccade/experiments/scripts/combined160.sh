#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined160/combined160.exp"
if [ -f $FPATH ]; then
	python experiment.py combined160 experiments/combined160
fi