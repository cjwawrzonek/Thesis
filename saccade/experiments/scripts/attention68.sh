#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention68/attention68.exp"
if [ -f $FPATH ]; then
	python experiment.py attention68 experiments/attention68
fi