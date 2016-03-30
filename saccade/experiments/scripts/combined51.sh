#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined51/combined51.exp"
if [ -f $FPATH ]; then
	python experiment.py combined51 experiments/combined51
fi