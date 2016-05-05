#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined131/combined131.exp"
if [ -f $FPATH ]; then
	python experiment.py combined131 experiments/combined131
fi