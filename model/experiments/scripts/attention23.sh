#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention23/attention23.exp"
if [ -f $FPATH ]; then
	python experiment.py attention23 experiments/attention23
fi