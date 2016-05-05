#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined93/combined93.exp"
if [ -f $FPATH ]; then
	python experiment.py combined93 experiments/combined93
fi