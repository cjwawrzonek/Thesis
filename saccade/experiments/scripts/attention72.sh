#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention72/attention72.exp"
if [ -f $FPATH ]; then
	python experiment.py attention72 experiments/attention72
fi