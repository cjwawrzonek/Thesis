#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention144/attention144.exp"
if [ -f $FPATH ]; then
	python experiment.py attention144 experiments/attention144
fi