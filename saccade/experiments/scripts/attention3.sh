#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention3/attention3.exp"
if [ -f $FPATH ]; then
	python experiment.py attention3 experiments/attention3
fi