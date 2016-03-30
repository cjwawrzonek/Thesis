#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention146/attention146.exp"
if [ -f $FPATH ]; then
	python experiment.py attention146 experiments/attention146
fi