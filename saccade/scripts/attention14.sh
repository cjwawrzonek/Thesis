#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention14/attention14.exp"
if [ -f $FPATH ]; then
	python experiment.py attention14 experiments/attention14
fi