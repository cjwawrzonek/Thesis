#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention46/attention46.exp"
if [ -f $FPATH ]; then
	python experiment.py attention46 experiments/attention46
fi