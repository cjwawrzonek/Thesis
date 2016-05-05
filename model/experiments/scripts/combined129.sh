#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined129/combined129.exp"
if [ -f $FPATH ]; then
	python experiment.py combined129 experiments/combined129
fi