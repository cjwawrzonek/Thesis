#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined105/combined105.exp"
if [ -f $FPATH ]; then
	python experiment.py combined105 experiments/combined105
fi