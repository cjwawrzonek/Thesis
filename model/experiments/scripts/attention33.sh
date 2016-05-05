#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention33/attention33.exp"
if [ -f $FPATH ]; then
	python experiment.py attention33 experiments/attention33
fi