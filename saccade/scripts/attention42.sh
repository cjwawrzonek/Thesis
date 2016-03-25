#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention42/attention42.exp"
if [ -f $FPATH ]; then
	python experiment.py attention42 experiments/attention42
fi