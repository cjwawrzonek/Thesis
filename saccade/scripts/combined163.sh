#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined163/combined163.exp"
if [ -f $FPATH ]; then
	python experiment.py combined163 experiments/combined163
fi