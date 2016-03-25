#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention156/attention156.exp"
if [ -f $FPATH ]; then
	python experiment.py attention156 experiments/attention156
fi