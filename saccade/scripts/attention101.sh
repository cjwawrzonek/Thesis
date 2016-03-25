#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention101/attention101.exp"
if [ -f $FPATH ]; then
	python experiment.py attention101 experiments/attention101
fi