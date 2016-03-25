#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention5/attention5.exp"
if [ -f $FPATH ]; then
	python experiment.py attention5 experiments/attention5
fi