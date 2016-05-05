#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention95/attention95.exp"
if [ -f $FPATH ]; then
	python experiment.py attention95 experiments/attention95
fi