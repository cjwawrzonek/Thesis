#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention38/attention38.exp"
if [ -f $FPATH ]; then
	python experiment.py attention38 experiments/attention38
fi