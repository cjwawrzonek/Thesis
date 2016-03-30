#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined59/combined59.exp"
if [ -f $FPATH ]; then
	python experiment.py combined59 experiments/combined59
fi