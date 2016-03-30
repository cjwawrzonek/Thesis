#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention135/attention135.exp"
if [ -f $FPATH ]; then
	python experiment.py attention135 experiments/attention135
fi