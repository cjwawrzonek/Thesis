#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention82/attention82.exp"
if [ -f $FPATH ]; then
	python experiment.py attention82 experiments/attention82
fi