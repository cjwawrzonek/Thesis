#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention129/attention129.exp"
if [ -f $FPATH ]; then
	python experiment.py attention129 experiments/attention129
fi