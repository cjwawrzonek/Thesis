#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention108/attention108.exp"
if [ -f $FPATH ]; then
	python experiment.py attention108 experiments/attention108
fi