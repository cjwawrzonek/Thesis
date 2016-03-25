#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention111/attention111.exp"
if [ -f $FPATH ]; then
	python experiment.py attention111 experiments/attention111
fi