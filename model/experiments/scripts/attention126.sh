#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention126/attention126.exp"
if [ -f $FPATH ]; then
	python experiment.py attention126 experiments/attention126
fi