#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention102/attention102.exp"
if [ -f $FPATH ]; then
	python experiment.py attention102 experiments/attention102
fi