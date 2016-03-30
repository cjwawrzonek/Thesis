#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention137/attention137.exp"
if [ -f $FPATH ]; then
	python experiment.py attention137 experiments/attention137
fi