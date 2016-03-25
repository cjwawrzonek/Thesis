#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection168/selection168.exp"
if [ -f $FPATH ]; then
	python experiment.py selection168 experiments/selection168
fi