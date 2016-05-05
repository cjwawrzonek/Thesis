#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention107/attention107.exp"
if [ -f $FPATH ]; then
	python experiment.py attention107 experiments/attention107
fi