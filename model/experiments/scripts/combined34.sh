#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined34/combined34.exp"
if [ -f $FPATH ]; then
	python experiment.py combined34 experiments/combined34
fi