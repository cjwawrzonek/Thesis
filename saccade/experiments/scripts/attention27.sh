#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention27/attention27.exp"
if [ -f $FPATH ]; then
	python experiment.py attention27 experiments/attention27
fi