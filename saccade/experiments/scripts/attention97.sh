#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention97/attention97.exp"
if [ -f $FPATH ]; then
	python experiment.py attention97 experiments/attention97
fi