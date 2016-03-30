#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention32/attention32.exp"
if [ -f $FPATH ]; then
	python experiment.py attention32 experiments/attention32
fi