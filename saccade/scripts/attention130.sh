#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention130/attention130.exp"
if [ -f $FPATH ]; then
	python experiment.py attention130 experiments/attention130
fi