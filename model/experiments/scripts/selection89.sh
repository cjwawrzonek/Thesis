#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection89/selection89.exp"
if [ -f $FPATH ]; then
	python experiment.py selection89 experiments/selection89
fi