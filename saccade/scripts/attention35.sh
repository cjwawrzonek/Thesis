#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention35/attention35.exp"
if [ -f $FPATH ]; then
	python experiment.py attention35 experiments/attention35
fi