#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention81/attention81.exp"
if [ -f $FPATH ]; then
	python experiment.py attention81 experiments/attention81
fi