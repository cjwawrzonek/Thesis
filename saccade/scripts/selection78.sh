#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection78/selection78.exp"
if [ -f $FPATH ]; then
	python experiment.py selection78 experiments/selection78
fi