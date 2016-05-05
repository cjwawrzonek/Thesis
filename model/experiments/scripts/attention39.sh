#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention39/attention39.exp"
if [ -f $FPATH ]; then
	python experiment.py attention39 experiments/attention39
fi