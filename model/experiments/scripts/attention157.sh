#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention157/attention157.exp"
if [ -f $FPATH ]; then
	python experiment.py attention157 experiments/attention157
fi