#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention77/attention77.exp"
if [ -f $FPATH ]; then
	python experiment.py attention77 experiments/attention77
fi