#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention7/attention7.exp"
if [ -f $FPATH ]; then
	python experiment.py attention7 experiments/attention7
fi