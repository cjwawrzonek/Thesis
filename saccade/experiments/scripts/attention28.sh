#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention28/attention28.exp"
if [ -f $FPATH ]; then
	python experiment.py attention28 experiments/attention28
fi