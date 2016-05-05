#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention114/attention114.exp"
if [ -f $FPATH ]; then
	python experiment.py attention114 experiments/attention114
fi