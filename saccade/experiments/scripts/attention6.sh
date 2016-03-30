#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention6/attention6.exp"
if [ -f $FPATH ]; then
	python experiment.py attention6 experiments/attention6
fi