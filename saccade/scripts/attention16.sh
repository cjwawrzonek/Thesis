#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention16/attention16.exp"
if [ -f $FPATH ]; then
	python experiment.py attention16 experiments/attention16
fi