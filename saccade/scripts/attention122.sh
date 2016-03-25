#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention122/attention122.exp"
if [ -f $FPATH ]; then
	python experiment.py attention122 experiments/attention122
fi