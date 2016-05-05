#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention2/attention2.exp"
if [ -f $FPATH ]; then
	python experiment.py attention2 experiments/attention2
fi