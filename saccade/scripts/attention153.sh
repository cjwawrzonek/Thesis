#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention153/attention153.exp"
if [ -f $FPATH ]; then
	python experiment.py attention153 experiments/attention153
fi