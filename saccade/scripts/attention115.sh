#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention115/attention115.exp"
if [ -f $FPATH ]; then
	python experiment.py attention115 experiments/attention115
fi