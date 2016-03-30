#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection163/selection163.exp"
if [ -f $FPATH ]; then
	python experiment.py selection163 experiments/selection163
fi