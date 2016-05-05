#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention25/attention25.exp"
if [ -f $FPATH ]; then
	python experiment.py attention25 experiments/attention25
fi