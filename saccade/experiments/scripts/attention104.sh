#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention104/attention104.exp"
if [ -f $FPATH ]; then
	python experiment.py attention104 experiments/attention104
fi