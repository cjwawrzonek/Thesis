#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention31/attention31.exp"
if [ -f $FPATH ]; then
	python experiment.py attention31 experiments/attention31
fi