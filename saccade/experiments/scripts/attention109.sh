#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention109/attention109.exp"
if [ -f $FPATH ]; then
	python experiment.py attention109 experiments/attention109
fi