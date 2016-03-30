#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention136/attention136.exp"
if [ -f $FPATH ]; then
	python experiment.py attention136 experiments/attention136
fi