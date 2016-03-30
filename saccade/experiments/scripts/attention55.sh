#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention55/attention55.exp"
if [ -f $FPATH ]; then
	python experiment.py attention55 experiments/attention55
fi