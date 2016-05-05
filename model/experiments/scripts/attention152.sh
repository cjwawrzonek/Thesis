#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention152/attention152.exp"
if [ -f $FPATH ]; then
	python experiment.py attention152 experiments/attention152
fi