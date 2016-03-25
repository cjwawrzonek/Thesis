#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention36/attention36.exp"
if [ -f $FPATH ]; then
	python experiment.py attention36 experiments/attention36
fi