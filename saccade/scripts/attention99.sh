#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention99/attention99.exp"
if [ -f $FPATH ]; then
	python experiment.py attention99 experiments/attention99
fi