#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention117/attention117.exp"
if [ -f $FPATH ]; then
	python experiment.py attention117 experiments/attention117
fi