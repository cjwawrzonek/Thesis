#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention45/attention45.exp"
if [ -f $FPATH ]; then
	python experiment.py attention45 experiments/attention45
fi