#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention88/attention88.exp"
if [ -f $FPATH ]; then
	python experiment.py attention88 experiments/attention88
fi