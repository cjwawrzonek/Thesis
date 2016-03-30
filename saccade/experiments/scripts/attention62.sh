#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention62/attention62.exp"
if [ -f $FPATH ]; then
	python experiment.py attention62 experiments/attention62
fi