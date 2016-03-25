#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention142/attention142.exp"
if [ -f $FPATH ]; then
	python experiment.py attention142 experiments/attention142
fi