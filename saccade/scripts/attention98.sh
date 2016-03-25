#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention98/attention98.exp"
if [ -f $FPATH ]; then
	python experiment.py attention98 experiments/attention98
fi