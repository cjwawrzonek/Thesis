#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention80/attention80.exp"
if [ -f $FPATH ]; then
	python experiment.py attention80 experiments/attention80
fi