#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention124/attention124.exp"
if [ -f $FPATH ]; then
	python experiment.py attention124 experiments/attention124
fi