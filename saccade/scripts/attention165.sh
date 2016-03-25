#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention165/attention165.exp"
if [ -f $FPATH ]; then
	python experiment.py attention165 experiments/attention165
fi