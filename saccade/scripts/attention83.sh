#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention83/attention83.exp"
if [ -f $FPATH ]; then
	python experiment.py attention83 experiments/attention83
fi