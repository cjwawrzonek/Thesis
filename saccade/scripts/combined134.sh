#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined134/combined134.exp"
if [ -f $FPATH ]; then
	python experiment.py combined134 experiments/combined134
fi