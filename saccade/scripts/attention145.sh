#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention145/attention145.exp"
if [ -f $FPATH ]; then
	python experiment.py attention145 experiments/attention145
fi