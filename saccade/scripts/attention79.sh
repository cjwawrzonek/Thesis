#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention79/attention79.exp"
if [ -f $FPATH ]; then
	python experiment.py attention79 experiments/attention79
fi