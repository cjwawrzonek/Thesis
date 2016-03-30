#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention106/attention106.exp"
if [ -f $FPATH ]; then
	python experiment.py attention106 experiments/attention106
fi