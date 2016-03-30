#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention40/attention40.exp"
if [ -f $FPATH ]; then
	python experiment.py attention40 experiments/attention40
fi