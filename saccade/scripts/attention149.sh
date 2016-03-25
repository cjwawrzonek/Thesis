#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention149/attention149.exp"
if [ -f $FPATH ]; then
	python experiment.py attention149 experiments/attention149
fi