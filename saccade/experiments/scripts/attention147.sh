#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention147/attention147.exp"
if [ -f $FPATH ]; then
	python experiment.py attention147 experiments/attention147
fi