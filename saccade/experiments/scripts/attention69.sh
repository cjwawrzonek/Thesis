#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention69/attention69.exp"
if [ -f $FPATH ]; then
	python experiment.py attention69 experiments/attention69
fi