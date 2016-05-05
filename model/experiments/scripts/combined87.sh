#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined87/combined87.exp"
if [ -f $FPATH ]; then
	python experiment.py combined87 experiments/combined87
fi