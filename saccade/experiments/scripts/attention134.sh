#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention134/attention134.exp"
if [ -f $FPATH ]; then
	python experiment.py attention134 experiments/attention134
fi