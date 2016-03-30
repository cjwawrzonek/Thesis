#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention74/attention74.exp"
if [ -f $FPATH ]; then
	python experiment.py attention74 experiments/attention74
fi