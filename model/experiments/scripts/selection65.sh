#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection65/selection65.exp"
if [ -f $FPATH ]; then
	python experiment.py selection65 experiments/selection65
fi