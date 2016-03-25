#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined27/combined27.exp"
if [ -f $FPATH ]; then
	python experiment.py combined27 experiments/combined27
fi