#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined169/combined169.exp"
if [ -f $FPATH ]; then
	python experiment.py combined169 experiments/combined169
fi