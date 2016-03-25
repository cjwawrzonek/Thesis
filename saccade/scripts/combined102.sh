#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined102/combined102.exp"
if [ -f $FPATH ]; then
	python experiment.py combined102 experiments/combined102
fi