#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined45/combined45.exp"
if [ -f $FPATH ]; then
	python experiment.py combined45 experiments/combined45
fi