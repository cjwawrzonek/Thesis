#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined4/combined4.exp"
if [ -f $FPATH ]; then
	python experiment.py combined4 experiments/combined4
fi