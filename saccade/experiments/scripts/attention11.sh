#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention11/attention11.exp"
if [ -f $FPATH ]; then
	python experiment.py attention11 experiments/attention11
fi