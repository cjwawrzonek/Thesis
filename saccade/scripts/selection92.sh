#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection92/selection92.exp"
if [ -f $FPATH ]; then
	python experiment.py selection92 experiments/selection92
fi