#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention59/attention59.exp"
if [ -f $FPATH ]; then
	python experiment.py attention59 experiments/attention59
fi