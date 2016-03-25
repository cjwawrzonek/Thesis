#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention18/attention18.exp"
if [ -f $FPATH ]; then
	python experiment.py attention18 experiments/attention18
fi