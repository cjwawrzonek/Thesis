#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention15/attention15.exp"
if [ -f $FPATH ]; then
	python experiment.py attention15 experiments/attention15
fi