#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined98/combined98.exp"
if [ -f $FPATH ]; then
	python experiment.py combined98 experiments/combined98
fi