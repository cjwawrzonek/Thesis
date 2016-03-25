#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined77/combined77.exp"
if [ -f $FPATH ]; then
	python experiment.py combined77 experiments/combined77
fi