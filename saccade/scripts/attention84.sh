#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention84/attention84.exp"
if [ -f $FPATH ]; then
	python experiment.py attention84 experiments/attention84
fi