#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention116/attention116.exp"
if [ -f $FPATH ]; then
	python experiment.py attention116 experiments/attention116
fi