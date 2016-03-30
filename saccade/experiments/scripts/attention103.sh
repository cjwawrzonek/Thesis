#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention103/attention103.exp"
if [ -f $FPATH ]; then
	python experiment.py attention103 experiments/attention103
fi