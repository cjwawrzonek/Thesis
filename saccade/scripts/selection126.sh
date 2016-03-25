#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection126/selection126.exp"
if [ -f $FPATH ]; then
	python experiment.py selection126 experiments/selection126
fi