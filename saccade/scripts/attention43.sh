#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention43/attention43.exp"
if [ -f $FPATH ]; then
	python experiment.py attention43 experiments/attention43
fi