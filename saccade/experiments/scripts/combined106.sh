#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined106/combined106.exp"
if [ -f $FPATH ]; then
	python experiment.py combined106 experiments/combined106
fi