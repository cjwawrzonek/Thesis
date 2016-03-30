#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention150/attention150.exp"
if [ -f $FPATH ]; then
	python experiment.py attention150 experiments/attention150
fi