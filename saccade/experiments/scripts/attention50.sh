#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention50/attention50.exp"
if [ -f $FPATH ]; then
	python experiment.py attention50 experiments/attention50
fi