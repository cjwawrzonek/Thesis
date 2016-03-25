#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention91/attention91.exp"
if [ -f $FPATH ]; then
	python experiment.py attention91 experiments/attention91
fi