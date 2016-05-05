#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention29/attention29.exp"
if [ -f $FPATH ]; then
	python experiment.py attention29 experiments/attention29
fi