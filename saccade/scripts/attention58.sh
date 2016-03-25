#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention58/attention58.exp"
if [ -f $FPATH ]; then
	python experiment.py attention58 experiments/attention58
fi