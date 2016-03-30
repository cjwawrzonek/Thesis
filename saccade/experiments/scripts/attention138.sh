#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention138/attention138.exp"
if [ -f $FPATH ]; then
	python experiment.py attention138 experiments/attention138
fi