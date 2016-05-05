#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention168/attention168.exp"
if [ -f $FPATH ]; then
	python experiment.py attention168 experiments/attention168
fi