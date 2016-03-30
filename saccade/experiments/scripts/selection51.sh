#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection51/selection51.exp"
if [ -f $FPATH ]; then
	python experiment.py selection51 experiments/selection51
fi