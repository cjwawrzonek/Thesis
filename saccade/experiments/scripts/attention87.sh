#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention87/attention87.exp"
if [ -f $FPATH ]; then
	python experiment.py attention87 experiments/attention87
fi