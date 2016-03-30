#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention112/attention112.exp"
if [ -f $FPATH ]; then
	python experiment.py attention112 experiments/attention112
fi