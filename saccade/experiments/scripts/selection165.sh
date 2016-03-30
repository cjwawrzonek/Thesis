#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection165/selection165.exp"
if [ -f $FPATH ]; then
	python experiment.py selection165 experiments/selection165
fi