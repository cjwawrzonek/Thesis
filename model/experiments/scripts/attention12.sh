#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention12/attention12.exp"
if [ -f $FPATH ]; then
	python experiment.py attention12 experiments/attention12
fi