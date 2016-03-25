#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention41/attention41.exp"
if [ -f $FPATH ]; then
	python experiment.py attention41 experiments/attention41
fi