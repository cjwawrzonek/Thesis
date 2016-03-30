#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined16/combined16.exp"
if [ -f $FPATH ]; then
	python experiment.py combined16 experiments/combined16
fi