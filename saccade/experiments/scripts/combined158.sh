#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined158/combined158.exp"
if [ -f $FPATH ]; then
	python experiment.py combined158 experiments/combined158
fi