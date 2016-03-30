#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention148/attention148.exp"
if [ -f $FPATH ]; then
	python experiment.py attention148 experiments/attention148
fi