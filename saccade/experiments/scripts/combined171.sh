#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined171/combined171.exp"
if [ -f $FPATH ]; then
	python experiment.py combined171 experiments/combined171
fi