#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined26/combined26.exp"
if [ -f $FPATH ]; then
	python experiment.py combined26 experiments/combined26
fi