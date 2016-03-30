#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention141/attention141.exp"
if [ -f $FPATH ]; then
	python experiment.py attention141 experiments/attention141
fi