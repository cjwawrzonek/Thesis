#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined47/combined47.exp"
if [ -f $FPATH ]; then
	python experiment.py combined47 experiments/combined47
fi