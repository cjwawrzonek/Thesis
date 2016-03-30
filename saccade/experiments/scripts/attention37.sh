#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention37/attention37.exp"
if [ -f $FPATH ]; then
	python experiment.py attention37 experiments/attention37
fi