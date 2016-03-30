#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention131/attention131.exp"
if [ -f $FPATH ]; then
	python experiment.py attention131 experiments/attention131
fi