#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention158/attention158.exp"
if [ -f $FPATH ]; then
	python experiment.py attention158 experiments/attention158
fi