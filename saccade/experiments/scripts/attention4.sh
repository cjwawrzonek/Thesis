#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention4/attention4.exp"
if [ -f $FPATH ]; then
	python experiment.py attention4 experiments/attention4
fi