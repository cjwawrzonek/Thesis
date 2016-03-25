#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined154/combined154.exp"
if [ -f $FPATH ]; then
	python experiment.py combined154 experiments/combined154
fi