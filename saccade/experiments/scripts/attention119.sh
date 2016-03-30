#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention119/attention119.exp"
if [ -f $FPATH ]; then
	python experiment.py attention119 experiments/attention119
fi