#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection22/selection22.exp"
if [ -f $FPATH ]; then
	python experiment.py selection22 experiments/selection22
fi