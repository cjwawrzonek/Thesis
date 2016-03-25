#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention34/attention34.exp"
if [ -f $FPATH ]; then
	python experiment.py attention34 experiments/attention34
fi