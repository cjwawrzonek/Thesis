#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined91/combined91.exp"
if [ -f $FPATH ]; then
	python experiment.py combined91 experiments/combined91
fi