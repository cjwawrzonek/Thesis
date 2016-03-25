#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention61/attention61.exp"
if [ -f $FPATH ]; then
	python experiment.py attention61 experiments/attention61
fi