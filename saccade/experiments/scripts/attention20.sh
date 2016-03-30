#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention20/attention20.exp"
if [ -f $FPATH ]; then
	python experiment.py attention20 experiments/attention20
fi