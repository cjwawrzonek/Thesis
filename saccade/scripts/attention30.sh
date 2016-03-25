#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention30/attention30.exp"
if [ -f $FPATH ]; then
	python experiment.py attention30 experiments/attention30
fi