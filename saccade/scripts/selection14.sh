#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection14/selection14.exp"
if [ -f $FPATH ]; then
	python experiment.py selection14 experiments/selection14
fi