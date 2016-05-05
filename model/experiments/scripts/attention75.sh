#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention75/attention75.exp"
if [ -f $FPATH ]; then
	python experiment.py attention75 experiments/attention75
fi