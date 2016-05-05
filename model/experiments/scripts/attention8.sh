#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention8/attention8.exp"
if [ -f $FPATH ]; then
	python experiment.py attention8 experiments/attention8
fi