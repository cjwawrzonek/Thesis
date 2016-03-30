#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection68/selection68.exp"
if [ -f $FPATH ]; then
	python experiment.py selection68 experiments/selection68
fi