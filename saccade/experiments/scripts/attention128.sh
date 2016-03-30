#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention128/attention128.exp"
if [ -f $FPATH ]; then
	python experiment.py attention128 experiments/attention128
fi