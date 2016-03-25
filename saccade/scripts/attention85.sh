#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention85/attention85.exp"
if [ -f $FPATH ]; then
	python experiment.py attention85 experiments/attention85
fi