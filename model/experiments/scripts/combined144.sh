#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined144/combined144.exp"
if [ -f $FPATH ]; then
	python experiment.py combined144 experiments/combined144
fi