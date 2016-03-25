#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection160/selection160.exp"
if [ -f $FPATH ]; then
	python experiment.py selection160 experiments/selection160
fi