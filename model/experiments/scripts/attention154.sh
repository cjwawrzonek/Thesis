#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention154/attention154.exp"
if [ -f $FPATH ]; then
	python experiment.py attention154 experiments/attention154
fi