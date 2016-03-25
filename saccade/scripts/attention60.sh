#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention60/attention60.exp"
if [ -f $FPATH ]; then
	python experiment.py attention60 experiments/attention60
fi