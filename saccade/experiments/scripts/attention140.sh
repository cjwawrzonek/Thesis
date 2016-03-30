#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention140/attention140.exp"
if [ -f $FPATH ]; then
	python experiment.py attention140 experiments/attention140
fi