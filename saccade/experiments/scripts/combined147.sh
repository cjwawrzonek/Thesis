#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined147/combined147.exp"
if [ -f $FPATH ]; then
	python experiment.py combined147 experiments/combined147
fi