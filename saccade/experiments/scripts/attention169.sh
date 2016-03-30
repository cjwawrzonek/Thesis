#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention169/attention169.exp"
if [ -f $FPATH ]; then
	python experiment.py attention169 experiments/attention169
fi