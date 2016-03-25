#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention143/attention143.exp"
if [ -f $FPATH ]; then
	python experiment.py attention143 experiments/attention143
fi