#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined116/combined116.exp"
if [ -f $FPATH ]; then
	python experiment.py combined116 experiments/combined116
fi