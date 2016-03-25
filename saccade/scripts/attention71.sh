#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention71/attention71.exp"
if [ -f $FPATH ]; then
	python experiment.py attention71 experiments/attention71
fi