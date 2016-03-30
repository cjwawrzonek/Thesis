#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention21/attention21.exp"
if [ -f $FPATH ]; then
	python experiment.py attention21 experiments/attention21
fi