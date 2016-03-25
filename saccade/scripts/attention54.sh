#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention54/attention54.exp"
if [ -f $FPATH ]; then
	python experiment.py attention54 experiments/attention54
fi