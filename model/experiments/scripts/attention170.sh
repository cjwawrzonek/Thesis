#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention170/attention170.exp"
if [ -f $FPATH ]; then
	python experiment.py attention170 experiments/attention170
fi