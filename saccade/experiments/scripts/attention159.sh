#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention159/attention159.exp"
if [ -f $FPATH ]; then
	python experiment.py attention159 experiments/attention159
fi