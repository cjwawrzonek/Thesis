#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention94/attention94.exp"
if [ -f $FPATH ]; then
	python experiment.py attention94 experiments/attention94
fi