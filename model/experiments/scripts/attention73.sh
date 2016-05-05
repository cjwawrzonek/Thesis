#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention73/attention73.exp"
if [ -f $FPATH ]; then
	python experiment.py attention73 experiments/attention73
fi