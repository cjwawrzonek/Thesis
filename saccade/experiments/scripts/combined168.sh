#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined168/combined168.exp"
if [ -f $FPATH ]; then
	python experiment.py combined168 experiments/combined168
fi