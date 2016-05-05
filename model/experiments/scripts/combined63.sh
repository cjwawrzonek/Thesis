#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined63/combined63.exp"
if [ -f $FPATH ]; then
	python experiment.py combined63 experiments/combined63
fi