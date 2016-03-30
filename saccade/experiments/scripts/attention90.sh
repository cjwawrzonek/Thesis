#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention90/attention90.exp"
if [ -f $FPATH ]; then
	python experiment.py attention90 experiments/attention90
fi