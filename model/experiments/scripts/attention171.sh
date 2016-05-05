#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention171/attention171.exp"
if [ -f $FPATH ]; then
	python experiment.py attention171 experiments/attention171
fi