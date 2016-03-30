#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection162/selection162.exp"
if [ -f $FPATH ]; then
	python experiment.py selection162 experiments/selection162
fi