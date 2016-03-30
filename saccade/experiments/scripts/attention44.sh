#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention44/attention44.exp"
if [ -f $FPATH ]; then
	python experiment.py attention44 experiments/attention44
fi