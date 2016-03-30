#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention17/attention17.exp"
if [ -f $FPATH ]; then
	python experiment.py attention17 experiments/attention17
fi