#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention64/attention64.exp"
if [ -f $FPATH ]; then
	python experiment.py attention64 experiments/attention64
fi