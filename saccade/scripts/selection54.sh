#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection54/selection54.exp"
if [ -f $FPATH ]; then
	python experiment.py selection54 experiments/selection54
fi