#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention113/attention113.exp"
if [ -f $FPATH ]; then
	python experiment.py attention113 experiments/attention113
fi