#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention66/attention66.exp"
if [ -f $FPATH ]; then
	python experiment.py attention66 experiments/attention66
fi