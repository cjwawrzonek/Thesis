#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention139/attention139.exp"
if [ -f $FPATH ]; then
	python experiment.py attention139 experiments/attention139
fi