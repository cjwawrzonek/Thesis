#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention24/attention24.exp"
if [ -f $FPATH ]; then
	python experiment.py attention24 experiments/attention24
fi