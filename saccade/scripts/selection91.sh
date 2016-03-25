#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection91/selection91.exp"
if [ -f $FPATH ]; then
	python experiment.py selection91 experiments/selection91
fi