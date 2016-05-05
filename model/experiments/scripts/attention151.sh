#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention151/attention151.exp"
if [ -f $FPATH ]; then
	python experiment.py attention151 experiments/attention151
fi