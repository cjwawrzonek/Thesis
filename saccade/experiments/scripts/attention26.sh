#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention26/attention26.exp"
if [ -f $FPATH ]; then
	python experiment.py attention26 experiments/attention26
fi