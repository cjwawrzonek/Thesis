#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection131/selection131.exp"
if [ -f $FPATH ]; then
	python experiment.py selection131 experiments/selection131
fi