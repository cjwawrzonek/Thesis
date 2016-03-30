#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection104/selection104.exp"
if [ -f $FPATH ]; then
	python experiment.py selection104 experiments/selection104
fi