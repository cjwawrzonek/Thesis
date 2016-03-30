#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention22/attention22.exp"
if [ -f $FPATH ]; then
	python experiment.py attention22 experiments/attention22
fi