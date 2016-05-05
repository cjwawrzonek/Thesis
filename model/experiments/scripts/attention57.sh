#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention57/attention57.exp"
if [ -f $FPATH ]; then
	python experiment.py attention57 experiments/attention57
fi