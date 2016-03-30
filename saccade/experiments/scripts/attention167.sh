#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention167/attention167.exp"
if [ -f $FPATH ]; then
	python experiment.py attention167 experiments/attention167
fi