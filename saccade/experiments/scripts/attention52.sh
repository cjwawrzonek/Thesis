#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention52/attention52.exp"
if [ -f $FPATH ]; then
	python experiment.py attention52 experiments/attention52
fi