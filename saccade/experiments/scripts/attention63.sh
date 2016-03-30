#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention63/attention63.exp"
if [ -f $FPATH ]; then
	python experiment.py attention63 experiments/attention63
fi