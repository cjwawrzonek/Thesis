#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection76/selection76.exp"
if [ -f $FPATH ]; then
	python experiment.py selection76 experiments/selection76
fi