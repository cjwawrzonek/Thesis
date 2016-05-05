#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention132/attention132.exp"
if [ -f $FPATH ]; then
	python experiment.py attention132 experiments/attention132
fi