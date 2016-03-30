#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined153/combined153.exp"
if [ -f $FPATH ]; then
	python experiment.py combined153 experiments/combined153
fi