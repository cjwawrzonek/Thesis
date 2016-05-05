#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection46/selection46.exp"
if [ -f $FPATH ]; then
	python experiment.py selection46 experiments/selection46
fi