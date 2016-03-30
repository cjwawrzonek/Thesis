#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention56/attention56.exp"
if [ -f $FPATH ]; then
	python experiment.py attention56 experiments/attention56
fi