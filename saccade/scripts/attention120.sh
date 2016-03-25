#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention120/attention120.exp"
if [ -f $FPATH ]; then
	python experiment.py attention120 experiments/attention120
fi