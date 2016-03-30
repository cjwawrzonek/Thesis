#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention92/attention92.exp"
if [ -f $FPATH ]; then
	python experiment.py attention92 experiments/attention92
fi