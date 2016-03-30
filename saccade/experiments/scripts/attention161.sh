#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention161/attention161.exp"
if [ -f $FPATH ]; then
	python experiment.py attention161 experiments/attention161
fi