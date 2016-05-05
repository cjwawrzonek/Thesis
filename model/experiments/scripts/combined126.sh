#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined126/combined126.exp"
if [ -f $FPATH ]; then
	python experiment.py combined126 experiments/combined126
fi