#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention78/attention78.exp"
if [ -f $FPATH ]; then
	python experiment.py attention78 experiments/attention78
fi