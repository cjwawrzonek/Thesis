#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention100/attention100.exp"
if [ -f $FPATH ]; then
	python experiment.py attention100 experiments/attention100
fi