#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention67/attention67.exp"
if [ -f $FPATH ]; then
	python experiment.py attention67 experiments/attention67
fi