#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection129/selection129.exp"
if [ -f $FPATH ]; then
	python experiment.py selection129 experiments/selection129
fi