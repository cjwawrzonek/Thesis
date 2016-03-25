#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention121/attention121.exp"
if [ -f $FPATH ]; then
	python experiment.py attention121 experiments/attention121
fi