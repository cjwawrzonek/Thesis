#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention49/attention49.exp"
if [ -f $FPATH ]; then
	python experiment.py attention49 experiments/attention49
fi