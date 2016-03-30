#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined151/combined151.exp"
if [ -f $FPATH ]; then
	python experiment.py combined151 experiments/combined151
fi