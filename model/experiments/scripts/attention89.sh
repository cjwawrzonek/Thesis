#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention89/attention89.exp"
if [ -f $FPATH ]; then
	python experiment.py attention89 experiments/attention89
fi