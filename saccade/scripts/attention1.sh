#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention1/attention1.exp"
if [ -f $FPATH ]; then
	python experiment.py attention1 experiments/attention1
fi