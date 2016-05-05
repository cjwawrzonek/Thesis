#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention118/attention118.exp"
if [ -f $FPATH ]; then
	python experiment.py attention118 experiments/attention118
fi