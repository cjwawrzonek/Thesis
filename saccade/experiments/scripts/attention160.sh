#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention160/attention160.exp"
if [ -f $FPATH ]; then
	python experiment.py attention160 experiments/attention160
fi