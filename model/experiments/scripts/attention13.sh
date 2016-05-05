#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention13/attention13.exp"
if [ -f $FPATH ]; then
	python experiment.py attention13 experiments/attention13
fi