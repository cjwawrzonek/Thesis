#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined97/combined97.exp"
if [ -f $FPATH ]; then
	python experiment.py combined97 experiments/combined97
fi