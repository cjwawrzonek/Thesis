#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention76/attention76.exp"
if [ -f $FPATH ]; then
	python experiment.py attention76 experiments/attention76
fi