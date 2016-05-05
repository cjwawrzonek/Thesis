#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention19/attention19.exp"
if [ -f $FPATH ]; then
	python experiment.py attention19 experiments/attention19
fi