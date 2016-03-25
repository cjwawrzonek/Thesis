#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention48/attention48.exp"
if [ -f $FPATH ]; then
	python experiment.py attention48 experiments/attention48
fi