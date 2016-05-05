#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined20/combined20.exp"
if [ -f $FPATH ]; then
	python experiment.py combined20 experiments/combined20
fi