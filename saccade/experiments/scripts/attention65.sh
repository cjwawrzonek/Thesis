#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention65/attention65.exp"
if [ -f $FPATH ]; then
	python experiment.py attention65 experiments/attention65
fi