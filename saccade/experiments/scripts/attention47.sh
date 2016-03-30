#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention47/attention47.exp"
if [ -f $FPATH ]; then
	python experiment.py attention47 experiments/attention47
fi