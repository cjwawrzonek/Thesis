#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention86/attention86.exp"
if [ -f $FPATH ]; then
	python experiment.py attention86 experiments/attention86
fi