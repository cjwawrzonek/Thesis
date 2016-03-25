#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention127/attention127.exp"
if [ -f $FPATH ]; then
	python experiment.py attention127 experiments/attention127
fi