#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention105/attention105.exp"
if [ -f $FPATH ]; then
	python experiment.py attention105 experiments/attention105
fi