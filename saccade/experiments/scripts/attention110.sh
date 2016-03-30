#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention110/attention110.exp"
if [ -f $FPATH ]; then
	python experiment.py attention110 experiments/attention110
fi