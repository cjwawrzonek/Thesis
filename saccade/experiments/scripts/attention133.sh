#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention133/attention133.exp"
if [ -f $FPATH ]; then
	python experiment.py attention133 experiments/attention133
fi