#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention162/attention162.exp"
if [ -f $FPATH ]; then
	python experiment.py attention162 experiments/attention162
fi