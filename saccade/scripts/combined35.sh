#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined35/combined35.exp"
if [ -f $FPATH ]; then
	python experiment.py combined35 experiments/combined35
fi