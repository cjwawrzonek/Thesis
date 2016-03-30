#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention155/attention155.exp"
if [ -f $FPATH ]; then
	python experiment.py attention155 experiments/attention155
fi