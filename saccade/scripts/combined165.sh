#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined165/combined165.exp"
if [ -f $FPATH ]; then
	python experiment.py combined165 experiments/combined165
fi