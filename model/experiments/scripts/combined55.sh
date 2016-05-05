#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined55/combined55.exp"
if [ -f $FPATH ]; then
	python experiment.py combined55 experiments/combined55
fi