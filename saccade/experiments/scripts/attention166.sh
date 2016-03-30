#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention166/attention166.exp"
if [ -f $FPATH ]; then
	python experiment.py attention166 experiments/attention166
fi