#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention10/attention10.exp"
if [ -f $FPATH ]; then
	python experiment.py attention10 experiments/attention10
fi