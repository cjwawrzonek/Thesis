#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention125/attention125.exp"
if [ -f $FPATH ]; then
	python experiment.py attention125 experiments/attention125
fi