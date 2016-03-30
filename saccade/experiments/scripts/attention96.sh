#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention96/attention96.exp"
if [ -f $FPATH ]; then
	python experiment.py attention96 experiments/attention96
fi